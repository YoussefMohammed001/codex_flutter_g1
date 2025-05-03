import 'package:codex_flutter_g1/core/routes/routes.dart';
import 'package:codex_flutter_g1/features/add_blog/view/screens/add_blog_screen.dart';
import 'package:codex_flutter_g1/features/home/view/screens/home_screen.dart';
import 'package:codex_flutter_g1/features/home/view_model/home_cubit.dart';
import 'package:codex_flutter_g1/features/login/view/screen/login_screen.dart';
import 'package:codex_flutter_g1/features/register/view/screens/register_screen.dart';
import 'package:codex_flutter_g1/features/splash/view/screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RoutesServices {

  static Route<dynamic> generateRoute(RouteSettings settings) {
    print("name ===> ${settings.name}");
    print("arguments ===> ${settings.arguments}");
    switch (settings.name) {
      case Routes.splash:
        return MaterialPageRoute(builder: (context) {
          return SplashScreen();
        });

      case Routes.login:
        return MaterialPageRoute(builder: (context) {
          return LoginScreen();
        });

      case Routes.register:
        return MaterialPageRoute(builder: (context) {
          return RegisterScreen();
        });

      case Routes.homeScreen:
        return MaterialPageRoute(builder: (context) {
          return BlocProvider(
            create: (context) => HomeCubit()..getBlogs(),
            child: HomeScreen(),
          );
        });
      case Routes.addBlogScreen:
        return MaterialPageRoute(builder: (context) {
          return AddBlogScreen();
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