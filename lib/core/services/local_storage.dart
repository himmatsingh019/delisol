import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static LocalStorage? _instance;
  static late SharedPreferences preferences;

  LocalStorage._();

  static LocalStorage get instance => _instance ??= LocalStorage._();

  static Future<void> init() async {
    preferences = await SharedPreferences.getInstance();
  }

  Future<void> setString(String key, String value) async {
    await preferences.setString(key, value);
  }

  Future<void> deleteToken(String key) async {
    await preferences.remove(key);
  }
}
