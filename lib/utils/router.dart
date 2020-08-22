part of 'utils.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case initialRoute:
        return MaterialPageRoute(
          builder: (ctx) => HomeScreen(title: titleArabic),
        );
      default:
        return MaterialPageRoute(
            builder: (ctx) => HomeScreen(title: titleArabic));
    }
  }
}

// containes routes for application
class AppRoutes {
  // eg.
  // static const String DetailScreen = "/detailScreen";
}
