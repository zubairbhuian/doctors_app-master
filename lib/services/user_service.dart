import 'package:doctors_app/utils/const_color.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserService {
  SharedPreferences? prefs;

  saveString({String? key, String? value}) async {
    prefs = await SharedPreferences.getInstance();
    return await prefs!.setString(key!, value!);
  }

  getString({String? key}) async {
    prefs = await SharedPreferences.getInstance();
    return prefs!.getString(key!);
  }

  saveBoolean({required String key, required bool value}) async {
    prefs = await SharedPreferences.getInstance();
    prefs!.setBool(key, value);
  }

  saveDouble({String? key, double? value}) async {
    prefs = await SharedPreferences.getInstance();
    return await prefs!.setDouble(key!, value!);
  }

  getDouble({String? key}) async {
    prefs = await SharedPreferences.getInstance();
    return prefs!.getDouble(key!);
  }

  saveInt({String? key, int? value}) async {
    prefs = await SharedPreferences.getInstance();
    return await prefs!.setInt(key!, value!);
  }

  getInt({String? key}) async {
    prefs = await SharedPreferences.getInstance();
    return prefs!.getInt(key!);
  }

  loginCheck() async {
    prefs = await SharedPreferences.getInstance();
    kLogger.i(prefs!.getBool('is-user'));
    if (prefs!.getBool('is-user') != null) {
      return prefs!.getBool('is-user');
    } else {
      return false;
    }
  }

  Future<bool?> getBool() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    bool? b = prefs.getBool('is-user');
    kLogger.i(b);
    return b;
  }

  getUserId() async {
    kLogger.i("came here");
    prefs = await SharedPreferences.getInstance();
    if (prefs!.getString('user-id') != null) {
      return prefs!.getString('user-id').toString();
    } else {
      return null;
    }
  }

  getToken() async {
    prefs = await SharedPreferences.getInstance();
    if (prefs!.getString('token') != null) {
      String? token = prefs!.getString('token');
      return "Bearer ${token!}";
    } else {
      return null;
    }
  }

  removeSharedPreferenceData() async {
    prefs = await SharedPreferences.getInstance();
    prefs!.remove('is-user');
    prefs!.remove('user-id');
    prefs!.remove('token');
  }
}
