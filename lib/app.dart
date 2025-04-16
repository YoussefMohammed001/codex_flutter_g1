import 'package:codex_flutter_g1/core/styles/app_colors.dart';
import 'package:codex_flutter_g1/features/splash/view/screen/splash_screen.dart';
import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
   MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {



   @override
  void initState() {
    super.initState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
        useMaterial3: true,
      ),

      home:  SplashScreen()

    );
  }
}