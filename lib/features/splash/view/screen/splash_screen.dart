import 'package:codex_flutter_g1/core/routes/routes.dart';
import 'package:codex_flutter_g1/core/styles/app_colors.dart';
import 'package:codex_flutter_g1/features/login/view/screen/login_screen.dart';
import 'package:codex_flutter_g1/features/login/view_model/login_cubt/login_cubit.dart';
import 'package:codex_flutter_g1/features/main_screen/view/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocProvider;
import 'package:shared_preferences/shared_preferences.dart' show SharedPreferences;

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  checkLoginStatus() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    int? userId = prefs.getInt("id");
    if (userId != null) {
  Navigator.pushNamed(context, Routes.main);
    } else {
      Navigator.pushNamed(context, Routes.login);
    }
  }

  @override
  void initState() {
    Future.delayed(Duration(
        seconds: 2
    )).then((onValue) {
      checkLoginStatus();
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.storefront_outlined, size: 100,
              color: AppColors.primaryColor,
            ),
            SizedBox(height: 10,),
            Text("SOUQ APP",
              style: TextStyle(
                  color: AppColors.blackTextColor,
                  fontWeight: FontWeight.w700,
                  fontSize: 25
              ),
            )
          ],
        ),
      ),
    );
  }
}
