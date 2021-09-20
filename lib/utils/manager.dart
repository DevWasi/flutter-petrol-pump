import 'package:shared_preferences/shared_preferences.dart';


class PreferenceManager {
  static PreferenceManager? _instance;
  static SharedPreferences? _preferences;

  static Future<PreferenceManager?> getInstance() async {
    _instance = PreferenceManager();
    _preferences = await SharedPreferences.getInstance();

    return _instance;
  }

  void setItem(String key, dynamic value) {_preferences!.setString(key, value);}

  dynamic getItem (String key) {return _preferences!.get(key);}

  void removeItem(String key){_preferences!.remove(key);}

}
