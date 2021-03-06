
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:maksap/sharepref/user_share_pref.dart';
import 'package:maksap/view/order_successfully.dart';
import 'package:maksap/widget/app_drawer.dart';

import 'tab.dart';


class AddOrder extends StatefulWidget {
  const AddOrder({Key? key}) : super(key: key);
  static const routeName = "/AddOrder";

  @override
  _AddOrderState createState() => _AddOrderState();
}

class _AddOrderState extends State<AddOrder> {
  DateTime timeBackPressed = DateTime.now();

  final _form = GlobalKey<FormState>();
  final locationFocus = FocusNode();
  final _numberPlayerFocus = FocusNode();
  var description = TextEditingController();
  var location = TextEditingController();
  final time = TextEditingController();

  DateTime date = DateTime.now();
  String? status = '';
  String? base64Image;
  File? tmpFile;
  var storedImage;
  String error = 'Error';
  bool _isLoading = false;
  String? fileName;
  String? locationPlayer;
  String? descriptionNamePlayer;
 late SharedPrefUser _sharedPrefUser;
 String _userPhone ="";

  final _firestore = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;




  @override
  void dispose() {
    locationFocus.dispose();
    _numberPlayerFocus.dispose();
    description.dispose();
    location.dispose();
    super.dispose();
  }

  Future<void> getPhone()async{
  _userPhone = await _sharedPrefUser.getPhone();
  }

   void addOrder() async {
    setState(() {
      _isLoading = true;
    });
    if (description.text.isNotEmpty) {
      Map<String, dynamic> orders = {
        "userId": "auth.currentUser!.uid",
        "user_phone": _userPhone,
        "description": description.text.trim(),
        "location": location.text.trim(),
        "time": time.text.trim(),
        "status":false,
      };

      await _firestore
          .collection('orders')
          .add(orders);
         
      // ScaffoldMessenger.of(context).showSnackBar(
      //     const SnackBar(content: Text("???? ?????????? ???????? ??????????")));
      setState(() {
        _isLoading = false;
      });

      description.clear();
      location.clear();
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (ctx) =>const OrderSuccessfully()));
    } else {
      setState(() {
        _isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          backgroundColor: Colors.red,
          duration: Duration(seconds: 1),
          content: Text(
            "...???????? ???????????? ???????????????? ",
            style: TextStyle(color: Colors.white),
            textAlign: TextAlign.end,
          )));
    }
  }


 
  Future<void> _saveForm() async {
    final isValid = _form.currentState!.validate();
    if (!isValid) {
      return null;
    }
    if (description.text == null && location.text == null && time.text == null) {
      return null;
    }
    _form.currentState!.save();
    setState(() {
      _isLoading = true;
    });

  
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         leading: IconButton(onPressed: (){
          Navigator.of(context).pop();
        }, icon:const Icon(Icons.navigate_before,color: Colors.white,size: 35,)),
        title:const Align(
          alignment: Alignment.centerRight,
          child:  Padding(
            padding: EdgeInsets.all(15.0),
            child: Text(
              "?????????? ??????",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        
      ),
      body: WillPopScope(
        onWillPop: () async {
          final differenc = DateTime.now().difference(timeBackPressed);
          final exitApp = differenc >=const Duration(seconds: 2);

          timeBackPressed = DateTime.now();

          if (exitApp) {
            // Fluttertoast.showToast(
            //     msg: AppLocalizations.of(context).backPressed,
            //     toastLength: Toast.LENGTH_SHORT,
            //     gravity: ToastGravity.BOTTOM,
            //     timeInSecForIosWeb: 1,
            //     backgroundColor: Colors.white,
            //     textColor: Colors.black,
            //     fontSize: 16.0);

            return false;
          } else {
            return true;
          }
        },
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 22, vertical: 8),
                child: Form(
                  key: _form,
                  child: ListView(
                    children: [
                      const SizedBox(height: 20),
                      const MyText(text: "?????? ??????????????"),
                      TextFormField(
                        textAlign: TextAlign.right,
                        controller: description,
                        maxLines: 4,
                        textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                  prefix:const Padding(
                    padding: EdgeInsets.all(4),
                  ),  border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(4),
                                                )
                  
                ),
                        keyboardType: TextInputType.text,
                        onFieldSubmitted: (_) {
                          FocusScope.of(context).requestFocus(locationFocus);
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "?????? ?????????? ?????????? ";
                          } 
                          return null;
                        },
                        onSaved: (value) {
                         
                        },
                      ),
                     const SizedBox(height: 20),
                      const MyText(text: "???????????? ????????????"),
                      TextFormField(
                        //initialValue: _initValues['phone'],
                        textAlign: TextAlign.right,
                        controller: location,
                         decoration: InputDecoration(
                  prefix:const Padding(
                    padding: EdgeInsets.all(4),
                  ),  border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(4),
                                                )
                  
                ),
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.text,
                        focusNode: locationFocus,
                        onFieldSubmitted: (_) {
                          FocusScope.of(context)
                              .requestFocus(_numberPlayerFocus);
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "?????? ?????????? ???????????? ";
                          } 
                          return null;
                        },
                        onSaved: (value) {
                          
                        },
                      ),
                     const SizedBox(height: 20),
                     const MyText(text: "?????? ????????????"),
                      TextFormField(
                        textAlign: TextAlign.right,
                        controller: time,
                        decoration: InputDecoration(
                  prefix:const Padding(
                    padding: EdgeInsets.all(4),
                  ),  border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(4),
                                                )
                  
                ),
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.text,
                        focusNode: _numberPlayerFocus,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "?????? ?????????? ?????? ????????????";
                          }
                          return null;
                        },
                        onSaved: (value) {
                         
                        },
                      ),
                    const  SizedBox(height: 100),
                 
                      ElevatedButton(onPressed: (){
                        _saveForm();
                        addOrder();
                       // Navigator.of(context).pushNamed(Jobs.routeName);
                      }, child: Padding(
                        padding:const  EdgeInsets.symmetric(vertical: 15),
                        child:_isLoading?const Center(child: CircularProgressIndicator(color: Colors.white,)):const  Text(
                               "?????????? ??????????",
                                style: TextStyle(fontSize: 16,color: Colors.white),
                                
                              ),
                      ),),
                   
                    
                    ],
                  ),
                ),
              ),
            ),
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
      style:const TextStyle(fontSize: 17),
      textAlign: TextAlign.right,
    );
  }
}