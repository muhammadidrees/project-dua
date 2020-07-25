import 'package:duas_pwa/screens/custom_widgets/custom_widgets.dart';
import 'package:flutter/material.dart';

/// row of buttom action buttons
class BottomActionBar extends StatelessWidget {
  const BottomActionBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: _buildChildren(context),
    );
  }

  /// returns the list of buttons to be placed inside
  /// row
  List<Widget> _buildChildren(BuildContext context) {
    return [
      // screenshot button
      RoundButton(
        icon: Icons.photo_camera,
      ),
      // random button to get new dua
      RoundButton(
        icon: Icons.refresh,
        backgroudColor: Theme.of(context).buttonColor,
      ),
      // copy content
      RoundButton(
        icon: Icons.content_copy,
      ),
    ];
  }
}
