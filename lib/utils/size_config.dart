/// Size Configuration for the app for dynamic sizes
/// based on different screen sizes

part of 'utils.dart';

class SizeConfig {
  /// screen width
  double screenWidth;

  /// screen height
  double screenHeight;

  /// screen width with safe area i.e. [screenWidth] - safe area padding horizontal
  double safeAreaHorizontal;

  /// screen height with safe area i.e. [screenWHeight] - safe area padding vertical
  double safeAreaVertical;

  /// horizonatal block size for the screen i.e. 100th part of scree or [screenWidth] / 100
  /// to keep things dynamic across all screens
  double get blockSizeHorizontal => screenWidth / 100;

  /// vertical block size for the screen i.e. 100th part of scree or [screenHeight] / 100
  /// to keep things dynamic across all screens
  double get blockSizeVertical => screenHeight / 100;

  /// horizonatal block size for the screen with safe area i.e. 100th part of (screer - safe area)
  /// or [screenWidth - safeAreaHorizontal] / 100 to keep things dynamic across all screens
  double get safeBlockHorizontal => (screenWidth - safeAreaHorizontal) / 100;

  /// horizonatal block size for the screen with safe area i.e. 100th part of (screer - safe area)
  /// or [screenWidth - safeAreaHorizontal] / 100 to keep things dynamic across all screens
  double get safeBlockVertical => (screenHeight - safeAreaVertical) / 100;

  /// Default construtor uses [WidgetBindings] to get screen sizes this is useful
  /// as we not always have the [BuildContext] of the app to use [MediaQueryData]
  SizeConfig({
    double screenWidth,
    double screenHeight,
    double safeAreaHorizontal,
    double safeAreaVertical,
  })  : this.screenWidth = screenWidth ??
            WidgetsBinding.instance.window.physicalSize.width /
                WidgetsBinding.instance.window.devicePixelRatio,
        this.screenHeight = screenHeight ??
            WidgetsBinding.instance.window.physicalSize.height /
                WidgetsBinding.instance.window.devicePixelRatio,
        this.safeAreaHorizontal = safeAreaHorizontal ??
            (WidgetsBinding.instance.window.padding.left +
                    WidgetsBinding.instance.window.padding.right) /
                WidgetsBinding.instance.window.devicePixelRatio,
        this.safeAreaVertical = safeAreaVertical ??
            (WidgetsBinding.instance.window.padding.top +
                    WidgetsBinding.instance.window.padding.bottom) /
                WidgetsBinding.instance.window.devicePixelRatio;

  /// Constructor to be used when [BuildContext] is known all the values are taken
  /// by using [MediaQuery] to get relative sizes
  factory SizeConfig.of(BuildContext context) {
    // media query data from context
    MediaQueryData _mediaQueryData = MediaQuery.of(context);

    // screen orientation
    Orientation _screenOrientation = _mediaQueryData.orientation;

    return SizeConfig(
      // based on the device orientation get the current width of screen
      screenWidth: (_screenOrientation == Orientation.portrait)
          ? _mediaQueryData.size.width
          : _mediaQueryData.size.height,
      // based on the device orientation get the current height of screen
      screenHeight: (_screenOrientation == Orientation.portrait)
          ? _mediaQueryData.size.height
          : _mediaQueryData.size.width,
      safeAreaHorizontal:
          _mediaQueryData.padding.top + _mediaQueryData.padding.bottom,
      safeAreaVertical:
          _mediaQueryData.padding.right + _mediaQueryData.padding.left,
    );
  }
}
