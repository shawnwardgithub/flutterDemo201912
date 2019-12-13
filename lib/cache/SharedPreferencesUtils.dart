import 'package:shared_preferences/shared_preferences.dart';

//获取缓存实例
class SharedPreferencesUtils {
  SharedPreferences _sharedPreferences;
  static  getSharedPreferences() async {
       SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
       return sharedPreferences;
  }
}