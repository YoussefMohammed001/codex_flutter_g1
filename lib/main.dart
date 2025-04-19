import 'package:codex_flutter_g1/app.dart';
import 'package:codex_flutter_g1/core/app_dio/app_dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart' show SharedPreferences;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppDio.init();
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  print("get user id: =====> ${prefs.getInt('id')}");
  print("get user id: =====> ${prefs.getString('name')}");
  print("get user id: =====> ${prefs.getString('email')}");
  runApp(MyApp());
}




