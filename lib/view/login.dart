import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:maksap/sharepref/user_share_pref.dart';
import 'package:maksap/view/tab.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController otpController = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;
    final _form = GlobalKey<FormState>();


  bool otpVisibility = false;

  String verificationID = "";
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Phone Auth",
          style: TextStyle(
            fontSize: 30,
          ),
        ),
        backgroundColor: Colors.indigo[900],
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
                Form(
                                      key: _form,
              child: TextFormField(
                
                controller: phoneController,
                decoration: InputDecoration(
                  hintText: '0992705340 مثلا',
                  prefix:const Padding(
                    padding: EdgeInsets.all(4),
                    //child: Text('+249'),
                  ),  border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(4),
                                                )
                  
                ),
                maxLength: 10,
                keyboardType: TextInputType.phone,
                 validator: (value) {
                                              if (value!.isEmpty||value.length>10||value.length<10) {
                                                return 'الرجاء ادخال رقم هاتف صحيح';
                                              }
                                              return null;
                                            },
                                            onSaved: (value) {},
                                          
                
              ),
            ),
            Visibility(
              child: TextField(
                controller: otpController,
                decoration: InputDecoration(
                  hintText: 'OTP',
                  prefix: Padding(
                    padding: EdgeInsets.all(4),
                    child: Text(''),
                  )
                  ,  border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(4),
                                                )
                ),
                maxLength: 6,
                keyboardType: TextInputType.number,
              ),
              visible: otpVisibility,
            ),
            SizedBox(
              height: 10,
            ),
            MaterialButton(
              color: Colors.indigo[900],
              onPressed: () {
              
                if (otpVisibility) {
                
                  verifyOTP();
                  
                } else {
                   
                  loginWithPhone();
                   
                }
              },
              child:_isLoading?const Center(child:  CircularProgressIndicator(                  color: Colors.white,
)): Text(
                otpVisibility ? "Verify" : "Login",
                style:const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void loginWithPhone() async {
        saveForm();

     
    auth.verifyPhoneNumber(
      phoneNumber: "+249" + phoneController.text,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await auth.signInWithCredential(credential).then((value) {
          print("You are logged in successfully");
        });
      },
      verificationFailed: (FirebaseAuthException e) {
        print("e.message : ${e.message}");
        ScaffoldMessenger.of(context).showSnackBar(
             SnackBar(content: Text("error : ${e.message}")));
      },
      codeSent: (String verificationId, int? resendToken) {
        otpVisibility = true;
        verificationID = verificationId;
        setState(() {});
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    ) ;
  setState(() {
                    _isLoading = false;
                  });
  }

  void verifyOTP() async {
      saveForm();
     setState(() {
                    _isLoading = true;
                  });
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationID, smsCode: otpController.text);

    await auth.signInWithCredential(credential).then(
      (value) {
       
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("You are logged in successfully"),duration: Duration(seconds: 1),),);
      },
    ).whenComplete(
      () {
        SharedPrefUser().savePhone(phoneController.text);
        SharedPrefUser().login();
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) =>const  TabScreen(),
          ),
        );
      },
    );
     setState(() {
                    _isLoading = false;
                  });
  }

  void saveForm() {
    final isValid =
                                              _form.currentState!.validate();
                                          if (!isValid) {
                                            return null;
                                          }
                                          _form.currentState!.save();
  }
}
