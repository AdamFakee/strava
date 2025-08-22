import 'package:shared_preferences/shared_preferences.dart';
import 'package:strava/utils/local_storage/share_preference/share_preference_storage_abstract.dart';

class SharePreferenceStorage implements SharePreferenceStorageAbstract {
  // constructor
  static final SharePreferenceStorage _instance = SharePreferenceStorage._internal();

  SharePreferenceStorage._internal();

  factory SharePreferenceStorage() => _instance;

  static SharePreferenceStorage get instance => _instance;

  // variables
  SharedPreferences? _storage;


  /// [init] method is initialized [SharedPreferences] storage with [storageName]
  /// 
  /// [storageName] is prefix of [SharedPreferences]. It's used to seperate private data for sepecific user. [storageName] commonly is userId
  @override
  Future<void> init([String? storageName]) async {
    if(storageName != null && storageName.isNotEmpty) {
      SharedPreferences.setPrefix(storageName);
    }
    _storage = await SharedPreferences.getInstance();
  }

  @override
  bool get hasInitialized => _storage != null;

  @override
  Future<void> clear() async {
    if(hasInitialized) {
      _storage!.clear();
    }
  }

  @override
  Object? get(String key) {
    return _storage?.get(key);
  }

  @override
  bool has(String key) {
    return _storage?.containsKey(key) ?? false;
  }

  @override
  Future<bool> remove(String key) async {
    return await _storage?.remove(key) ?? false;
  }

  @override
  Future<void> set(String key, String value) async {
    print("iniitilazed::: $hasInitialized");
    
    await _storage?.setString(key, value);
  }
}