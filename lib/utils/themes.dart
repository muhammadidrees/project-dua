part of 'utils.dart';

/// default light theme of app
final ThemeData kDuaLightTheme = _buildShrineTheme();

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
    appBarTheme: AppBarTheme(
      elevation: 0.0,
      color: Colors.transparent,
      centerTitle: true,
    ),
    buttonBarTheme: base.buttonBarTheme.copyWith(
      buttonTextTheme: ButtonTextTheme.accent,
    ),
    scaffoldBackgroundColor: kDuaOffWhite,
    cardColor: kDuaScaffoldBackgroundColor,
    textSelectionColor: kDuaOrangeLight,
    errorColor: kDuaOrangeDark,
    textTheme: base.textTheme.copyWith(
      // title of applicaion on appbar
      headline5: GoogleFonts.reemKufi().copyWith(
        color: kDuaDarkBlue,
      ),
    ),
  );
}
