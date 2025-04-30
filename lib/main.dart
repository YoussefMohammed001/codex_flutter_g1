import 'package:codex_flutter_g1/app.dart';
import 'package:codex_flutter_g1/core/cash/app_preferences.dart';
import 'package:codex_flutter_g1/core/cash/preference_keys.dart';
import 'package:firebase_core/firebase_core.dart' show Firebase;
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await AppPreferences.init();

  print("user id====> ${AppPreferences.getString(key: PreferenceKeys.userId)}");
  runApp(MyApp());

}




