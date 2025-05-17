import 'package:codex_flutter_g1/core/routes/routes.dart';
import 'package:codex_flutter_g1/features/home/presentation/screens/home_screen.dart';
import 'package:codex_flutter_g1/features/splash/view/screen/splash_screen.dart';
import 'package:flutter/material.dart';

class RoutesServices {

  static Route<dynamic> generateRoute(RouteSettings settings) {
    print("name ===> ${settings.name}");
    print("arguments ===> ${settings.arguments}");
    switch (settings.name) {
      case Routes.splash:
        return MaterialPageRoute(builder: (context) {
          return SplashScreen();
        });
        case Routes.homeScreen:
        return MaterialPageRoute(builder: (context) {
          return HomeScreen();
        });
        default:
        return MaterialPageRoute(builder: (context) {
          return Scaffold(
            body: Center(
              child: Text("Not Found"),
            ),
          );
        });
    }
  }
}