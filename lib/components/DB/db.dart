
import 'package:flutter/cupertino.dart';
import 'package:encrypted_shared_preferences/encrypted_shared_preferences.dart';

class LocalDB extends ChangeNotifier {
  EncryptedSharedPreferences encryptedSharedPreferences =
      EncryptedSharedPreferences();
  Future<String> readData(String tableName) async {
    final items = await encryptedSharedPreferences.getString(tableName);
    return items;
  }

  Future<bool> writeData(String tableName, String data) async {
    final items = await encryptedSharedPreferences.setString(tableName, data);
    return items;
  }

  Future<bool> removeData(String tableName) async {
    final items = encryptedSharedPreferences.remove(tableName);
    return items;
  }

  Future<bool> removeAllData() async {
    final isCleared = encryptedSharedPreferences.clear();
    return isCleared;
  }
}
