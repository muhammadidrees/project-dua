part of 'utils.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case initialRoute:
        return MaterialPageRoute(
          builder: (ctx) => HomeScreen(),
        );
      default:
        return MaterialPageRoute(builder: (ctx) => HomeScreen());
    }
  }
}

// containes routes for application
class AppRoutes {
  // eg.
  // static const String DetailScreen = "/detailScreen";
}
