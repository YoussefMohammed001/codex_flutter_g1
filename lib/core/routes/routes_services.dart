import 'package:codex_flutter_g1/core/routes/routes.dart';
import 'package:codex_flutter_g1/features/home/view/screens/home_screen.dart';
import 'package:codex_flutter_g1/features/login/view/screen/login_screen.dart';
import 'package:codex_flutter_g1/features/login/view_model/login_cubt/login_cubit.dart';
import 'package:codex_flutter_g1/features/main_screen/view/screens/main_screen.dart';
import 'package:codex_flutter_g1/features/product_details/product_details_args.dart';
import 'package:codex_flutter_g1/features/product_details/view/screen/product_details_screen.dart';
import 'package:codex_flutter_g1/features/product_details/view_model/product_details_cubit.dart';
import 'package:codex_flutter_g1/features/splash/view/screen/splash_screen.dart';
import 'package:flutter/cupertino.dart';
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
          return BlocProvider(
            create: (context) => LoginCubit(),
            child: LoginScreen(),
          );
        });
      case Routes.main:
        return MaterialPageRoute(builder: (context) {
          return MainScreen();
        });
      case Routes.productDetails:
        return MaterialPageRoute(builder: (context) {
          final args = settings.arguments as ProductDeailsArgs;
          return ProductDetailsScreen(productDeailsArgs:args ,);
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