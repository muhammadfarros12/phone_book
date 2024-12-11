import 'package:get_storage/get_storage.dart';

class PLocalStorage {
  static final PLocalStorage _instance = PLocalStorage._internal();

  factory PLocalStorage(){
    return _instance;
  }

  PLocalStorage._internal();

  final _storage = GetStorage();

  Future<void> saveData<T>(String key, T value) async{
    await _storage.write(key, value);
  }
  
  Future<void> readData<T>(String key) async{
    await _storage.read(key);
  }

  Future<void> removeData(String key) async{
    await _storage.remove(key);
  }

  Future<void> clearAll() async{
    await _storage.erase();
  }
}