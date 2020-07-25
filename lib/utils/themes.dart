part of 'utils.dart';

/// default light theme of app
final ThemeData kDuaLightTheme = _buildDuaTheme();

/// dark theme of app
final ThemeData kDuaDarkTheme = _buildDuaDarkTheme();

/// light theme of app
ThemeData _buildDuaTheme() {
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
    floatingActionButtonTheme: base.floatingActionButtonTheme.copyWith(
      backgroundColor: Colors.blue,
    ),
    scaffoldBackgroundColor: kDuaOffWhite,
    cardColor: kDuaWhiteColor,
    buttonColor: kDuaOrangeLight,
    textSelectionColor: kDuaOrangeLight,
    errorColor: kDuaOrangeDark,
    textTheme: base.textTheme.copyWith(
      // title of applicaion on appbar
      headline5: GoogleFonts.reemKufi(
        color: kDuaDarkBlue,
      ),
      // arabic text
      bodyText1: GoogleFonts.amiri(
        fontSize: SizeConfig().blockSizeVertical * 4,
        height: SizeConfig().blockSizeVertical * 0.4,
        color: kDuaOrangeDark,
        fontWeight: FontWeight.w700,
      ),
      // translation text
      bodyText2: GoogleFonts.roboto(
        fontSize: SizeConfig().blockSizeVertical * 2.5,
        color: kDuaBlackColor,
      ),
      // reference text
      caption: GoogleFonts.reemKufi(
        color: kDuaDarkBlue,
        fontSize: SizeConfig().blockSizeVertical * 2,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

ThemeData _buildDuaDarkTheme() {
  // use the light theme as reference
  final ThemeData base = kDuaLightTheme;

  return base.copyWith(
    primaryColor: kDuaOffWhite,
    scaffoldBackgroundColor: kDuaDarkestBlue.withOpacity(1),
    cardColor: kDuaBlackColor,
    textTheme: base.textTheme.copyWith(
      headline5: base.textTheme.headline5.copyWith(
        color: kDuaOffWhite,
      ),
      bodyText1: base.textTheme.bodyText1.copyWith(
        color: kDuaYellow,
      ),
      bodyText2: base.textTheme.bodyText2.copyWith(
        color: kDuaWhiteColor.withOpacity(0.8),
      ),
      caption: base.textTheme.caption.copyWith(
        color: kDuaOffWhite,
      ),
    ),
  );
}
