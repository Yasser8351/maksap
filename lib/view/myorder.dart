import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dart:io';

import 'package:maksap/widget/app_drawer.dart';

class MyOrder extends StatefulWidget {
  const MyOrder({Key? key}) : super(key: key);
  static const routeName = "/MyOrder";

  @override
  _MyOrderState createState() => _MyOrderState();
}

class _MyOrderState extends State<MyOrder> {
  

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Align(
          alignment: Alignment.centerRight,
          child: Text(
            "الطلبات الحالية",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
            drawer:const AppDrawer(),

         body: SizedBox(
            child: Column(
              children: [
                StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection('orders')
                        .orderBy("time")
                        .snapshots(),
                    builder: (ctx, AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else {
                        final data = snapshot.data!.docs;
                        
                        return SizedBox(
                          height: size.height - 150,
                          child: ListView.builder(
                            itemCount: data.length,
                            itemBuilder: (ctx, index) {
                              return  Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Card(
                                  
                                   elevation: 10,
                                  child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                             ListTile(
                                       leading: Text(
                                                "${data[index]["description"]}",
                                                style: const TextStyle(
                                                    color: Colors.black, fontSize: 18),
                                              ),
                                       trailing:const Text(
                                                "وصف الطلب",
                                                style:  TextStyle(
                                                    color: Colors.black, fontSize: 18),
                                              ),
                                     
                                   ),
                             ListTile(
                                       leading: Text(
                                                "${data[index]["time"]}",
                                                style: const TextStyle(
                                                    color: Colors.black, fontSize: 18),
                                              ),
                                       trailing:const Text(
                                         
"تاريخ الطلب",                                              style:  TextStyle(
                                                    color: Colors.black, fontSize: 18),
                                              ),
                                     
                                   ),
                             ListTile(
                                       leading: Text(
                                                "${data[index]["location"]}",
                                                style: const TextStyle(
                                                    color: Colors.black, fontSize: 18),
                                              ),
                                       trailing:const Text(
                                                "موقع الطلب",
                                                style:  TextStyle(
                                                    color: Colors.black, fontSize: 18),
                                              ),
                                     
                                   ),
                             ListTile(
                                       leading: Text(
                                              data[index]["status"]?  "مكتمل":"قيد المعالجة",
                                                style: const TextStyle(
                                                    color: Colors.black, fontSize: 18),
                                              ),
                                       trailing:const Text(
                                                "حالة الطلب",
                                                style:  TextStyle(
                                                    color: Colors.black, fontSize: 18),
                                              ),
                                     
                                   ),
                                    const SizedBox(height: 4)
                                  ],
                            ),
                                ),
                              );
                            }
                            
                            
                          ),
                        );
                      }
                    }),
           
              ],
            ),
          ),
   
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