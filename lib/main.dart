import 'package:duas_pwa/cubit/theme/theme_cubit.dart';
import 'package:duas_pwa/repository/repository.dart';
import 'package:flutter/material.dart';
import 'package:duas_pwa/utils/utils.dart';
import 'package:flutter_cubit/flutter_cubit.dart';

void main() {
  // make sure they are initialized
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  /// theme repository to get stored theme value if any
  final ThemeRepository _themeRepository = ThemeRepository();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // the purpose of future builder is to set the initial
    // theme of the webapp in corresopondence with the data
    // stored in local storage using [ThemeRepository]
    return FutureBuilder<String>(
        future: _themeRepository.getTheme(),
        builder: (context, snapshot) {
          // show a page loader until we get data from our local
          // storage
          return (snapshot.hasData)
              // Provider for the theme cubit used to manage theme changes
              ? CubitProvider(
                  create: (_) =>
                      ThemeCubit(initialTheme: snapshot.data == "dark"),
                  // rebuild the entire material widget on theme changes
                  child: CubitBuilder<ThemeCubit, bool>(
                    builder: (context, isThemeDark) => MaterialApp(
                      title: titleEnglish,
                      theme: isThemeDark ? kDuaDarkTheme : kDuaLightTheme,
                      initialRoute: initialRoute,
                      debugShowCheckedModeBanner: false,
                      onGenerateRoute: Router.generateRoute,
                    ),
                  ),
                )
              : Center(child: CircularProgressIndicator());
        });
  }
}
