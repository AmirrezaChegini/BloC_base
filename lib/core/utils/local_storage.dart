import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static const LocalStorage _i = LocalStorage._internal();

  const LocalStorage._internal();

  factory LocalStorage() => _i;

  static late final SharedPreferences _box;

  static Future<void> init() async {
    _box = await SharedPreferences.getInstance();
  }

  static Future<void> saveData({required String key, required dynamic value}) async {
    await _box.setString(key, value);
  }

  static String readData({required String key}) {
    return _box.getString(key) ?? '';
  }

  static Future<void> deleteData({required String key}) async {
    await _box.remove(key);
  }

  static Future<void> clearAll() async {
    await _box.clear();
  }
}
