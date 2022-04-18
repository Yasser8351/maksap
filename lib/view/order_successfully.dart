import 'package:flutter/material.dart';
import 'package:maksap/view/myorder.dart';
class OrderSuccessfully extends StatelessWidget {
  const OrderSuccessfully({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
                  color: Colors.green[50],
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                                                Image.asset("assets/images/xlp.gif"),
                        const SizedBox(height: 40),

                       const Text(
                         'تم ارسال الطلب بنجاح'
                             ,
                          style:  TextStyle(
                              color: Colors.black54, fontSize: 20),
                        ),
                     const   Text(
                         'جميع الخدمات المقدمة مضمونة بضمان التطبيق'
                             ,
                          style:  TextStyle(
                              color: Colors.black54, fontSize: 20),
                        ),
                        
                        const SizedBox(height: 40),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pushNamedAndRemoveUntil(MyOrder.routeName, (route) => false);
                          },
                          child:const SizedBox(
                            width: 80,
                            child:  Center(
                              child: Text(
                                'الذهاب الي طلباتي',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
    );
  }
}
