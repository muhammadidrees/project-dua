import 'package:duas_pwa/screens/home_screen/ayah_card.dart';
import 'package:duas_pwa/utils/utils.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final String title;

  const HomeScreen({
    Key key,
    @required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: Theme.of(context).textTheme.headline5,
        ),
      ),
      body: Container(
        // to give column max width
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: _buildChildren(context),
        ),
      ),
    );
  }

  List<Widget> _buildChildren(BuildContext context) {
    return [
      Material(
        borderRadius: defaultBorderRadius,
        elevation: 6.0,
        child: AyahCard(
          ayah: "رَّبِّ زِدْنِي عِلْمًا",
          translation: "My Lord! Increase me in knowledge.",
          reference: "Surah TaHa (20:114)",
        ),
      ),
    ];
  }
}
