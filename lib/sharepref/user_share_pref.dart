import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefUser {
 late SharedPreferences _prefs ;

 Future<bool> login()async{
 _prefs = await  SharedPreferences.getInstance();
 return await _prefs.setBool("login", true);   
 }

 Future<bool> isLogin()async{
 _prefs = await SharedPreferences.getInstance();
   return  _prefs.getBool("login")??false;
 }
 Future<String> getPhone()async{
   _prefs = await SharedPreferences.getInstance();
   return ( _prefs.getString("phone")??"");
 }
 Future<void> savePhone(String phone)async{
   _prefs = await SharedPreferences.getInstance();
   await (_prefs.setString("phone",phone));
 }


}