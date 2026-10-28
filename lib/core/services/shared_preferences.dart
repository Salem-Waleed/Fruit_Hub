import 'package:shared_preferences/shared_preferences.dart';

class Prefs {
  static late SharedPreferences _instance;  

  static Future<void> init() async {
    _instance = await SharedPreferences.getInstance();
  }

  static  setBool(String key,bool value) {
    _instance.setBool(key, value);
  }

  static bool? getBool(String key) {
    return _instance.getBool(key) ?? false;
  }
}


// class SharedPreferencesService {
//   SharedPreferencesService._();

//   static final SharedPreferencesService _instance = SharedPreferencesService._();

//   static SharedPreferencesService get instance => _instance;

//   SharedPreferences? _prefs;

//   Future<void> init() async {
//     _prefs ??= await SharedPreferences.getInstance();
//   }

//   SharedPreferences get _storage {
//     if (_prefs == null) {
//       throw StateError(
//         'SharedPreferencesService is not initialized. Call SharedPreferencesService.instance.init() before use.',
//       );
//     }
//     return _prefs!;
//   }

//   Future<void> setString(String key, String value) async {
//     await _storage.setString(key, value);
//   }

//   String? getString(String key) => _storage.getString(key);

//   Future<void> setBool(String key, bool value) async {
//     await _storage.setBool(key, value);
//   }

//   bool? getBool(String key) => _storage.getBool(key);

//   Future<void> remove(String key) async {
//     await _storage.remove(key);
//   }

//   Future<void> clear() async {
//     await _storage.clear();
//   }
// }
