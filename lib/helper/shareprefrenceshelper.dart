import 'package:shared_preferences/shared_preferences.dart';

class SharePreferencesHelper {
  static SharePreferencesHelper sharePreferenceHelper;
  static const String USER_DATA = 'pre_user';
  static const String OS_VERSION = 'pre_os_version';
  static const String DEVICE_TYPE = 'pre_device_type';
  static const String ACCESS_TOKEN = 'pre_access_token';

  static SharePreferencesHelper getInstant() {
    if (sharePreferenceHelper == null) {
      sharePreferenceHelper = new SharePreferencesHelper();
    }
    return sharePreferenceHelper;
  }

  Future<String> getString(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.getString(key) ?? "";
  }

  setString(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }

  Future<int> getInt(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (await prefs.getInt(key) == null) {
      return 0;
    }
    return await prefs.getInt(key);
  }

  setInt(String key, int value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt(key, value);
  }

  Future<bool> getBool(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (await prefs.getBool(key) == null) {
      return false;
    }
    return await prefs.getBool(key);
  }

  setBool(String key, bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(key, value);
  }

  clearPreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }
}
