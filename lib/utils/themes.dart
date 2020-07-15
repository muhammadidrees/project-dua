part of 'utils.dart';

/// default light theme of app
final ThemeData _kLightTheme = _buildShrineTheme();

ThemeData _buildShrineTheme() {
  // set original material theme as base theme
  final ThemeData base = ThemeData.light();
  // copy additional themes changes on top of base theme
  return base.copyWith(
    accentColor: kDuaYellow,
    primaryColor: kDuaDarkBlue,
    buttonTheme: base.buttonTheme.copyWith(
      buttonColor: kDuaOrangeDark,
      colorScheme: base.colorScheme.copyWith(
        secondary: kDuaOrangeLight,
      ),
    ),
    buttonBarTheme: base.buttonBarTheme.copyWith(
      buttonTextTheme: ButtonTextTheme.accent,
    ),
    scaffoldBackgroundColor: kDuaOffWhite,
    cardColor: kDuaScaffoldBackgroundColor,
    textSelectionColor: kDuaOrangeLight,
    errorColor: kDuaOrangeDark,
  );
}
