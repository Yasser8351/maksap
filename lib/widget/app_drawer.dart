
import 'package:flutter/material.dart';
import 'package:maksap/sharepref/user_share_pref.dart';
import 'package:maksap/view/about_app.dart';
import 'package:maksap/view/google_map_screen.dart';
import 'package:maksap/view/myorder.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({Key? key,}) : super(key: key);
  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  bool isUpdated = false;
  bool isLoading = true;
 late SharedPrefUser sharedPrefUser;
 String _phone ="";

  late int newUpdatedBalance;

  @override
  void initState() {
    super.initState();
    getPhone();
    
  }

  Future<void> getPhone()async{

     _phone = await  sharedPrefUser.getPhone();



  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Drawer(
      child: Container(
        color: Colors.blue,
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top,
          bottom: size.height * 0.1,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Stack(
              children: [
               Container(
                    height: size.height * 0.16,
                    margin: EdgeInsets.only(
                      bottom: size.height * 0.01,
                    ),
                    padding: EdgeInsets.only(
                        right: size.height * 0.009,
                        left: size.height * 0.009,
                        top: size.height * 0.025,
                        bottom: size.height * 0.01),
                    color: Colors.blue.shade600,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            //name and phone number
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: size.width * 0.26,
                                    child: Text(
                                     _phone,
                                      textAlign: TextAlign.right,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                          fontFamily: 'Changa',
                                          color: Colors.white),
                                    ),
                                  ),
                                  SizedBox(
                                    height: size.height * 0.007,
                                  ),
                                  Text(
                                    _phone,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: Colors.white38,
                                      fontFamily: 'Changa',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                           const CircleAvatar(
                              radius: 25,
                              child: Icon(Icons.person),
                               
                            ),
                          ],
                        ),
                     
                      ],
                    ),
                  ), 
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.settings,
                    size: 19,
                    color: Colors.white54,
                  ),
                ),
              ],
            ),
            buildDrawerItem(
                context: context,
                icon: Icons.compass_calibration,
                label: "انشاء طلب",
                ontTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const GoogleMapScreen()));
                }),
            buildDrawerItem(
                context: context,
                icon: Icons.line_style_sharp,
                label: "الطلبات الحالية",
                ontTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MyOrder()));
                }),
            buildDrawerItem(
                context: context,
                icon: Icons.list_alt,
                label: "الطلبات المكتملة",
                ontTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MyOrder()));
                }),
            buildDrawerItem(
                context: context,
                icon: Icons.phone,
                label: "اتصل بنا",
                ontTap: () async {
                  //966559744223
                  // String? whatsappPhone =
                  //     await SharedPrefCompany().getCompanyPhoneNo();
                  // FlutterOpenWhatsapp.sendSingleMessage("+$whatsappPhone", "");
                }),
            buildDrawerItem(
                context: context,
                icon: Icons.info,
                label: "حول التطبيق",
                ontTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AboutApp()));
                }),
      
          ],
        ),
      ),
    );
  }
}


buildDrawerItem(
    {required BuildContext context,
    required IconData icon,
    required String label,
    required void Function() ontTap
    
    }
    
    ) {

  return Column(
    children: [
      TextButton(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              label,
              style: const TextStyle(fontFamily: 'Changa', color: Colors.white),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.03,
            ),

            /*Image.asset('assets/drawer/$icon.png',
              height:MediaQuery.of(context).size.width * 0.06,),*/

            Icon(
              icon,
              color: Colors.white,
            )
          ],
        ),
        onPressed: () {
          // Navigator.pop(context);
          ontTap();
        },
      ),
    const  SizedBox(
        height: 7,
      )
    ],
  );
}
