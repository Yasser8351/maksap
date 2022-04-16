import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:maksap/widget/app_drawer.dart';

class AboutApp extends StatefulWidget {
  const AboutApp({Key? key}) : super(key: key);
  static const routeName = "/AboutApp";

  @override
  _AboutAppState createState() => _AboutAppState();
}

class _AboutAppState extends State<AboutApp> {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "نبذة عن الفنيين",
        ),
      ),
            drawer:const AppDrawer(),

         
        );
  
   
    
  }
}

class MyText extends StatelessWidget {
  const MyText({
    Key? key, this.text,
  }) : super(key: key);
  final  text;

  @override
  Widget build(BuildContext context) {
    return  Text(
     text,
      style:const TextStyle(fontSize: 14),
    );
  }
}