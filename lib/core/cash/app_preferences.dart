import 'package:codex_flutter_g1/core/cash/preference_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppPreferences {
  static SharedPreferences? _preferences;

  static Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static Future<void> setString(
      {
        required PreferenceKeys key,
        required String value
      }) async {
    await _preferences!.setString(key.name, value);
  }


  static String getString({required PreferenceKeys key,}){
    return _preferences?.getString(key.name) ?? "";
  }

}
