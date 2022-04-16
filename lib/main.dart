/*import 'package:flutter/material.dart';
import 'package:maksap/view/about_app.dart';
import 'package:maksap/view/add_order.dart';
import 'package:maksap/view/jobs.dart';
import 'package:maksap/view/tab.dart';
import 'package:firebase_core/firebase_core.dart';

import 'view/myorder.dart';
import 'view/user_phone_auth_screen.dart';
import 'view/user_verify_phone_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Maksab',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme(
          primary: Color(0xff095BA4),
          onPrimary: Color(0xff095BA4),
          primaryVariant: Colors.deepPurple,
          background: Color(0xff868C8F),
          onBackground: Colors.black,
          secondary: Color(0xff095BA4),
          onSecondary: Colors.white,
          secondaryVariant: Colors.black87,
          error: Colors.red,
          onError: Colors.orange.shade200,
          surface: Colors.white,
          onSurface: Colors.black54,
          brightness: Brightness.light,
        ),),
      home:  const PhoneAuthentication(),
      routes: {
        AddOrder.routeName : (ctx) =>const AddOrder(),
        MyOrder.routeName : (ctx) =>const MyOrder(),
        Jobs.routeName : (ctx) =>const Jobs(),
        AboutApp.routeName : (ctx) =>const AboutApp()
      },
    );
  }
}
  */

/* 
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'view/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: LoginScreen(),
        debugShowCheckedModeBanner: false,
        color: Colors.indigo[900]);
  }
}
*/

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:maksap/view/splash_screen.dart';

import 'view/about_app.dart';
import 'view/add_order.dart';
import 'view/jobs.dart';
import 'view/myorder.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home:const SplashScreen(),
        routes: {
        AddOrder.routeName : (ctx) =>const AddOrder(),
        MyOrder.routeName : (ctx) =>const MyOrder(),
        Jobs.routeName : (ctx) =>const Jobs(),
        AboutApp.routeName : (ctx) =>const AboutApp()
      },
    );
  }
}
