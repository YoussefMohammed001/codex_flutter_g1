import 'package:codex_flutter_g1/app.dart';
import 'package:codex_flutter_g1/core/cash/app_preferences.dart';
import 'package:codex_flutter_g1/core/cash/preference_keys.dart';
import 'package:codex_flutter_g1/core/di/di.dart';
import 'package:codex_flutter_g1/core/network/network_services.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();
  await NetworkServices.init();
  await AppPreferences.init();
  await setupGetIt();
  //initFcm();
  print("user id====> ${AppPreferences.getString(key: PreferenceKeys.userId)}");

  runApp(
    DevicePreview(
      enabled: true,
      tools: const [
        ...DevicePreview.defaultTools,
      ],
      builder: (context) => const MyApp(),
    ),
  );
  // runApp(MyApp());
}
