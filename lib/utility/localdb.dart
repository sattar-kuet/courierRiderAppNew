import 'package:courier_rider/main.dart';

class LocalDB {
  static void setDB(String DB) => sharedPreferences.setString('DB', DB);
  static String? get getDB => sharedPreferences.getString('DB');

  static void setUID(int uid) => sharedPreferences.setInt('uid', uid);
  static int? get getUID => sharedPreferences.getInt('uid');

  static void setToken(String token) =>
      sharedPreferences.setString('token', token);
  static String? get getToken => sharedPreferences.getString('token');
}
