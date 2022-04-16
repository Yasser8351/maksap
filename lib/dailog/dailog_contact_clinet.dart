import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContactClientDailog extends StatefulWidget {
  const ContactClientDailog({Key? key}) : super(key: key);

  @override
  _ContactClientDailogState createState() => _ContactClientDailogState();
}

class _ContactClientDailogState extends State<ContactClientDailog> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return PopupMenuButton(
        itemBuilder: (_) => const <PopupMenuItem<String>>[
              PopupMenuItem<String>(child: Text('Doge'), value: 'Doge'),
              PopupMenuItem<String>(child: Text('Lion'), value: 'Lion'),
            ],
        onSelected: (_) {});
  }
}
