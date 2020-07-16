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
    cardColor: kDuaCardColor,
    textSelectionColor: kDuaOrangeLight,
    errorColor: kDuaOrangeDark,
    textTheme: base.textTheme.copyWith(
      // title of applicaion on appbar
      headline5: GoogleFonts.reemKufi(
        color: kDuaDarkBlue,
      ),
      bodyText1: GoogleFonts.amiri(
          fontSize: SizeConfig().blockSizeVertical * 4,
          height: SizeConfig().blockSizeVertical * 0.4,
          color: kDuaOrangeDark,
          fontWeight: FontWeight.bold),
      bodyText2: GoogleFonts.roboto(
        fontSize: SizeConfig().blockSizeVertical * 2.5,
        color: kDuaBlackColor,
      ),
      caption: GoogleFonts.reemKufi(
        color: kDuaDarkBlue,
        fontSize: SizeConfig().blockSizeVertical * 2,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
