import 'package:flutter/material.dart';
import 'package:duas_pwa/utils/utils.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: titleEnglish,
      theme: kDuaLightTheme,
      initialRoute: initialRoute,
      onGenerateRoute: Router.generateRoute,
    );
  }
}
