part of 'custom_widgets.dart';

/// Round shape action button buttons
class RoundButton extends StatelessWidget {
  /// funtion to be performed when the button is tapped
  /// if left null the button will be inacitve
  final Function onPressed;

  /// Icon to be placed in the body of button
  final IconData icon;

  /// spacing around the button by default a value
  /// of [paddingM] is used
  final EdgeInsets margin;

  /// background color for the button a default value
  /// of [floatingActionButtonTheme.bacgroundColor] is
  /// used
  final Color backgroudColor;

  RoundButton({
    Key key,
    this.onPressed,
    this.backgroudColor,
    @required this.icon,
    EdgeInsets margin,
  })  : this.margin = margin ?? EdgeInsets.all(paddingM),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: FloatingActionButton(
        backgroundColor: backgroudColor,
        onPressed: onPressed,
        child: Icon(icon),
      ),
    );
  }
}
