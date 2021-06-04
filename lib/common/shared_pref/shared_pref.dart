import 'dart:convert';

import 'package:boilerplate/feature/authentication/model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static const THEME_MODE = "ThemeMode";

  static const FontSize = "AppFontSize";
  static const HDImage = "AppHDImage";
  static const Notification = "AppNotification";

  static const RepeatMode = "RepeatMode";
  static const User_Key = "AppUser";
  static const FirstTimeAppOpen = 'FirstTimeAppOpen';

  static Future setFirstTimeAppOpen(bool status) async {
    final _instance = await SharedPreferences.getInstance();
    await _instance.setBool(FirstTimeAppOpen, status);
  }

  static Future<bool> getFirstTimeAppOpen() async {
    final _instance = await SharedPreferences.getInstance();
    final res = _instance.getBool(FirstTimeAppOpen);
    if (res == null) return true;
    return res;
  }

  static Future setUser(User user) async {
    final _instance = await SharedPreferences.getInstance();
    await _instance.setString(User_Key, json.encode(user.toJson()));
  }

  static Future<User?> getUser() async {
    final _instance = await SharedPreferences.getInstance();
    final res = _instance.getString(User_Key);
    if (res == null) return null;
    return User.fromJson(json.decode(res));
  }

  static Future deleteUser() async {
    final _instance = await SharedPreferences.getInstance();
    await _instance.remove(User_Key);
  }
}
