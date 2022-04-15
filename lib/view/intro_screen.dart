import 'package:maksap/sharepref/user_share_pref.dart';
import 'package:flutter/material.dart';
import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:maksap/view/login.dart';

import 'home.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    getUserStatus();
  }

  bool userStatus = false;

  
  getUserStatus()async{

    SharedPrefUser _prefs = SharedPrefUser();

   bool _currentStatus =await _prefs.isLogin();

   setState(() {
     userStatus =  _currentStatus ;
   });
    

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.10),
        child: EasySplashScreen(
          durationInSeconds: 3,
          navigator: userStatus ? Home() : const LoginScreen(),
          logo: Image.asset(
            'assets/images/markeruser.png',
            fit: BoxFit.fill,
          ),
          
          logoSize: 220,
          backgroundColor: Colors.white,
          loaderColor: Colors.white,
        ),
      ),
    );
  }
}
