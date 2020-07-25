import 'package:duas_pwa/bloc/ayah_bloc.dart';
import 'package:duas_pwa/screens/custom_widgets/custom_widgets.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

  SnackBar _snackBar(String message, {SnackBarAction action}) => SnackBar(
        content: Text(message),
        action: action,
      );

  /// returns the list of buttons to be placed inside
  /// row
  List<Widget> _buildChildren(BuildContext context) {
    return [
      // screenshot button
      // RoundButton(
      //   icon: Icons.photo_camera,
      // ),
      // random button to get new dua
      RoundButton(
        icon: Icons.refresh,
        backgroudColor: Theme.of(context).buttonColor,
        onPressed: () {
          context.bloc<AyahBloc>().add(AyahFetched());
        },
      ),
      // copy content
      RoundButton(
        icon: Icons.content_copy,
        onPressed: () {
          AyahState state = context.bloc<AyahBloc>().state;
          if (state is AyahSuccess) {
            // copy ayah to clipboard
            Clipboard.setData(new ClipboardData(text: state.ayah.toString()));
            // show a snackbar message
            Scaffold.of(context).showSnackBar(_snackBar("Copied to ClipBoard"));
          }
        },
      ),
    ];
  }
}
