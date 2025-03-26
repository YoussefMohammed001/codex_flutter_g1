import 'package:codex_flutter_g1/app.dart';
import 'package:codex_flutter_g1/database/app_database.dart';
import 'package:flutter/material.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppDatabase.init();
  runApp(const MyApp());
}







