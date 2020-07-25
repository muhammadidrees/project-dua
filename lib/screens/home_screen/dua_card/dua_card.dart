import 'package:auto_size_text/auto_size_text.dart';
import 'package:duas_pwa/models/models.dart';
import 'package:duas_pwa/utils/utils.dart';
import 'package:flutter/material.dart';

part 'reference_text.dart';

/// Card to display the dua with it's reference and translation
class DuaCard extends StatelessWidget {
  /// dua model of the dua to be represented
  final Dua dua;

  /// height factor of the card the total height will be this
  /// factor multiplied by [MediaQuery.of(context).size.height]
  final double cardHeightFactor = 0.8;

  /// width factor of the card the total width will be this
  /// factor multiplied by [MediaQuery.of(context).size.width]
  final double cardWidthFactor = 0.8;

  const DuaCard({
    Key key,
    @required this.dua,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: defaultBorderRadius,
      elevation: kdefaultElevation,
      color: Theme.of(context).cardColor,
      child: Container(
        width: MediaQuery.of(context).size.width * .8,
        height: MediaQuery.of(context).size.height * .8,
        // padding of the entire card
        padding: EdgeInsets.all(paddingL),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: _buildChildren(context),
          ),
        ),
      ),
    );
  }

  /// content of the card to be shown in column
  List<Widget> _buildChildren(BuildContext context) {
    return [
      // arabic dua
      _constrainedBox(
        context,
        Center(
          child: _autoSizeText(
            context,
            dua.dua,
            Theme.of(context).textTheme.bodyText1,
            minFontSize: 12.0,
          ),
        ),
        heightFactor: 0.4,
      ),
      // refereance with translation
      _constrainedBox(
        context,
        DuaReference(reference: dua.reference),
        heightFactor: 0.05,
      ),
      // dua translation
      _constrainedBox(
        context,
        _autoSizeText(
          context,
          dua.translation,
          Theme.of(context).textTheme.bodyText2,
        ),
      ),
    ];
  }

  /// auto size text is used so the [text] auto adjust itself and
  /// doesn't overflow inside it's constraints; optional [minFontSize]
  /// and [maxFontSize] can be given if we want to adjust the [AutoSizeText]
  /// widget else default of [4.0] and [null] is used for both of them
  /// respectfully also [style] stylizes the parameter [text]
  AutoSizeText _autoSizeText(
    BuildContext context,
    String text,
    TextStyle style, {
    double minFontSize = 4.0,
    double maxFontSize,
  }) {
    return AutoSizeText(
      text,
      style: style,
      textAlign: TextAlign.center,
      minFontSize: minFontSize,
    );
  }

  /// This widget is useful to constraints the text elements of the card to the
  /// provided width and height move over a center is used to make the [child]
  /// i.e. the text widget to be contained in the center an option [heightFactor]
  /// is also taken as argument in case we want to change the height of the
  /// constraint
  ConstrainedBox _constrainedBox(
    BuildContext context,
    Widget child, {
    double heightFactor = 0.35,
  }) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * heightFactor,
        maxWidth: MediaQuery.of(context).size.width,
        minHeight: MediaQuery.of(context).size.height * heightFactor,
        minWidth: MediaQuery.of(context).size.width,
      ),
      child: child,
    );
  }
}
