import 'package:codex_flutter_g1/bmi_calc/bmi_calculator_screen.dart';
import 'package:codex_flutter_g1/home_screen.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: BmiCalculatorScreen(),
    );
  }
}