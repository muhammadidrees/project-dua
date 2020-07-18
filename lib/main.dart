import 'package:duas_pwa/cubit/theme/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:duas_pwa/utils/utils.dart';
import 'package:flutter_cubit/flutter_cubit.dart';

void main() {
  // make sure they are initialized
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CubitProvider(
      create: (_) => ThemeCubit(),
      child: CubitBuilder<ThemeCubit, bool>(
        builder: (context, isThemeDark) => MaterialApp(
          title: titleEnglish,
          theme: isThemeDark ? kDuaDarkTheme : kDuaLightTheme,
          initialRoute: initialRoute,
          debugShowCheckedModeBanner: false,
          onGenerateRoute: Router.generateRoute,
        ),
      ),
    );
  }
}
