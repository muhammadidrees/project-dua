import 'package:duas_pwa/utils/utils.dart';
import 'package:flutter/material.dart';

/// Card to display the ayah with it's reference and translation
class AyahCard extends StatelessWidget {
  /// arabic of ayah
  final String ayah;

  /// translation of ayah
  final String translation;

  /// reference of ayah
  final String reference;

  const AyahCard({
    Key key,
    @required this.ayah,
    @required this.translation,
    @required this.reference,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.of(context).blockSizeHorizontal * 80,
      padding: EdgeInsets.all(SizeConfig.of(context).blockSizeHorizontal * 2),
      child: Column(
        children: [
          Padding(
            padding:
                EdgeInsets.all(SizeConfig.of(context).blockSizeVertical * 2),
            child: Text(
              ayah,
              style: Theme.of(context).textTheme.bodyText1,
              textAlign: TextAlign.center,
            ),
          ),
          Divider(),
          Padding(
            padding:
                EdgeInsets.all(SizeConfig.of(context).blockSizeVertical * 2),
            child: Text(
              translation,
              style: Theme.of(context).textTheme.bodyText2,
              textAlign: TextAlign.center,
            ),
          ),
          Text(
            reference,
            style: Theme.of(context).textTheme.caption,
          )
        ],
      ),
    );
  }
}
