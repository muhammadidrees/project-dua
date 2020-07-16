import 'package:auto_size_text/auto_size_text.dart';
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
      width: MediaQuery.of(context).size.width * .8,
      height: MediaQuery.of(context).size.height * .8,
      padding: EdgeInsets.all(paddingL),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height * .35,
              maxWidth: MediaQuery.of(context).size.width,
              minHeight: MediaQuery.of(context).size.height * .35,
              minWidth: MediaQuery.of(context).size.width,
            ),
            child: Center(
              child: AutoSizeText(
                ayah,
                style: Theme.of(context).textTheme.bodyText1,
                textAlign: TextAlign.center,
                minFontSize: 4.0,
              ),
            ),
          ),
          ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height * .03,
              maxWidth: MediaQuery.of(context).size.width,
              minHeight: MediaQuery.of(context).size.height * .03,
              minWidth: MediaQuery.of(context).size.width,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    color: Theme.of(context).primaryColor.withOpacity(.5),
                    height: 1.0,
                  ),
                ),
                Container(
                  color: Theme.of(context).cardColor,
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(horizontal: marginM),
                  child: AutoSizeText(
                    reference,
                    maxLines: 1,
                    minFontSize: 8.0,
                    maxFontSize: 10.0,
                    style: Theme.of(context).textTheme.caption,
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Theme.of(context).primaryColor.withOpacity(.5),
                    height: 1.0,
                  ),
                ),
              ],
            ),
          ),
          ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height * .35,
              maxWidth: MediaQuery.of(context).size.width,
              minHeight: MediaQuery.of(context).size.height * .35,
              minWidth: MediaQuery.of(context).size.width,
            ),
            child: Center(
              child: AutoSizeText(
                translation,
                style: Theme.of(context).textTheme.bodyText2,
                textAlign: TextAlign.center,
                minFontSize: 4.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
