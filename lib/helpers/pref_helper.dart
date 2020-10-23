import 'package:shared_preferences/shared_preferences.dart';

class PrefHelper {
  // Interval 600000 means handle cache for 600000 milliseconds or 10 minutes
  static Future<bool> storeCache(String key, String json) {
    print('store json : $json');
    return SharedPreferences.getInstance().then((prefs) {
      return prefs.setString(key, json);
    });
  }

  static Future<bool> clearCache(String key) {
    return SharedPreferences.getInstance().then((prefs) {
      return prefs.setString(key, null);
    });
  }

  static Future<String> getCache(String key) async {
    var prefs = await SharedPreferences.getInstance();
    String jsonString = prefs.getString(key);
    print('stored json string : $jsonString');
    if (jsonString == null) return null;
    return jsonString;
  }
}
