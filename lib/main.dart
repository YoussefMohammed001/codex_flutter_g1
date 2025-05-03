import 'package:codex_flutter_g1/app.dart';
import 'package:codex_flutter_g1/core/app_dio/app_dio.dart';
import 'package:codex_flutter_g1/notifications_services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart' show SharedPreferences;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  await AppDio.init();
  final SharedPreferences prefs = await SharedPreferences.getInstance();
await NotificationsServices().init();
  print("get user id: =====> ${prefs.getInt('id')}");
  print("get user id: =====> ${prefs.getString('name')}");
  print("get user id: =====> ${prefs.getString('email')}");
  runApp(MyApp());
}




