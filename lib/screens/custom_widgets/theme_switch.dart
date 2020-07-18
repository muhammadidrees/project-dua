part of 'custom_widgets.dart';

/// A switch to change theme of the app from light to dark
class ThemeSwitch extends StatelessWidget {
  const ThemeSwitch({
    Key key,
  }) : super(key: key);

  /// just so I don't have to repeat that ugly commant :P
  bool _isDarkTheme(BuildContext context) {
    return context.bloc<ThemeCubit>().state;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // bulb icon to indicate on and off
        Icon(
          Icons.lightbulb_outline,
          color: _isDarkTheme(context) ? kDuaBlackColor : kDuaOrangeLight,
        ),
        // switch
        Switch(
          activeColor: kDuaDarkBlue,
          activeTrackColor: kDuaBlackColor,
          inactiveTrackColor: kDuaOrangeLight,
          inactiveThumbColor: kDuaWhiteColor,
          value: _isDarkTheme(context),
          onChanged: (value) {
            context.bloc<ThemeCubit>().toggleTheme(value);
          },
        ),
      ],
    );
  }
}
