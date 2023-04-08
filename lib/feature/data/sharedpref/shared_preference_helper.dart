import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../data/constants.dart';
import '../remote/network/constants/shared-preference.dart';

class AppSharedPreferences {
  static Future<SharedPreferences> getInstance() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs;
  }

//<---------------------------- Clear Data -------------------------------------//

  static Future<bool> clear() async {
    SharedPreferences prefs = await getInstance();
    return await prefs.clear();
  }

//<---------------------------- String -------------------------------------//

  static Future<String> getStringData(String key) async {
    SharedPreferences prefs = await getInstance();
    return prefs.getString(key) ?? '';
  }

  static Future<bool> setStringData(String key, String value) async {
    SharedPreferences prefs = await getInstance();
    return prefs.setString(key, value);
  }

//<---------------------------- Bool -------------------------------------//

  static Future<bool> getBoolData(String key) async {
    SharedPreferences prefs = await getInstance();
    return prefs.getBool(key) ?? false;
  }

  static Future<bool> setBoolData(String key, bool value) async {
    SharedPreferences prefs = await getInstance();
    return prefs.setBool(key, value);
  }

//<---------------------------- Double -------------------------------------//

  static Future<double> getDoubleData(String key) async {
    SharedPreferences prefs = await getInstance();
    return prefs.getDouble(key) ?? 0.0;
  }

  static Future<bool> setDoubleData(String key, double value) async {
    SharedPreferences prefs = await getInstance();
    return prefs.setDouble(key, value);
  }

//<---------------------------- Int -------------------------------------//

  static Future<int> getIntegerData(String key) async {
    SharedPreferences prefs = await getInstance();
    return prefs.getInt(key) ?? 0;
  }

  static Future<bool> setIntegerData(String key, int value) async {
    SharedPreferences prefs = await getInstance();
    return prefs.setInt(key, value);
  }

  static Future<String> getUserAuthKey() async {
    SharedPreferences prefs = await getInstance();
    return prefs.getString(SharedPreferenceKeys.TOKEN) ?? "";
  }

  static Future<bool> setUserAuthKey(String authkey) async {
    SharedPreferences prefs = await getInstance();
    return prefs.setString(SharedPreferenceKeys.TOKEN, authkey);
  }

  static Future<String> getUserKey() async {
    SharedPreferences prefs = await getInstance();
    return prefs.getString(SharedPreferenceKeys.loginKey) ?? "";
  }

  static Future<bool> setUserKey(String authkey) async {
    SharedPreferences prefs = await getInstance();
    return prefs.setString(SharedPreferenceKeys.loginKey, authkey);
  }

  static Future<String> getRefreshAuthKey() async {
    SharedPreferences prefs = await getInstance();
    return prefs.getString(SharedPreferenceKeys.REFRESH_TOKEN) ?? "";
  }

  static Future<bool> setRefreshAuthKey(String authkey) async {
    SharedPreferences prefs = await getInstance();
    return prefs.setString(SharedPreferenceKeys.REFRESH_TOKEN, authkey);
  }

  static Future<Map<String, dynamic>> getUserData() async {
    SharedPreferences prefs = await getInstance();
    return json.decode(prefs.getString(SharedPreferenceKeys.USERDATA) ?? '');
  }

  static Future<bool> setUserData(
      Map<String, dynamic> val,
      ) async {
    SharedPreferences prefs = await getInstance();
    return prefs.setString(SharedPreferenceKeys.USERDATA, json.encode(val));
  }

  static Future<bool> setBaseUrl(String url) async {
    SharedPreferences prefs = await getInstance();
    return prefs.setString(SharedPreferenceKeys.BASE_URL, url);
  }

  static Future<String> getBaseUrl() async {
    SharedPreferences prefs = await getInstance();
    return prefs.getString(SharedPreferenceKeys.BASE_URL) ?? "";
  }
}
