/// [SharePreferenceStorageAbstract] interface
abstract class SharePreferenceStorageAbstract {
  Future<void> init (String storageName);

  bool get hasInitialized;

  bool has (String key);

  Future<void> clear ();

  Object? get (String key);

  Future<void> set (String key, String value);

  Future<bool> remove (String key);
}