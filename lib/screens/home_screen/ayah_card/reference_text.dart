part of 'ayah_card.dart';

/// Widget used to show the [refernce] for an ayah between two lins
class AyahReference extends StatelessWidget {
  const AyahReference({
    Key key,
    @required this.reference,
  }) : super(key: key);

  /// widget to be displayed b/w to vertical lines
  final String reference;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // starting line
        _line(context),
        // text
        _referenceText(context, reference),
        // entind line
        _line(context),
      ],
    );
  }

  /// create the text widget to be displayed at the center
  Widget _referenceText(BuildContext context, String text) {
    return Container(
      alignment: Alignment.center,
      // to have spacing between the lines and the text in the center
      margin: EdgeInsets.symmetric(horizontal: marginM),
      child: AutoSizeText(
        text,
        maxLines: 1,
        minFontSize: 8.0,
        maxFontSize: 10.0,
        style: Theme.of(context).textTheme.caption,
      ),
    );
  }

  /// vertical line to be placed on both side of text
  Expanded _line(BuildContext context) {
    return Expanded(
      child: Container(
        color: Theme.of(context).primaryColor.withOpacity(.5),
        height: 1.0,
      ),
    );
  }
}
