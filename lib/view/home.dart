// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';


// class Home extends StatefulWidget {
//   @override
//   _HomeState createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   String? uid;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Home'),
     
//       ),
//       body: Center(
//         child: Text(uid!),
//       ),
//     );
//   }

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     uid = FirebaseAuth.instance.currentUser!.uid;
//   }
// }
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'login.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String uid = "";
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo[900],
        title: const Text('Home'),
      ),
      body: Stack(
        children: [
          const GoogleMap(
              initialCameraPosition: CameraPosition(
                  zoom: 14,
                  target: LatLng(
                    15.592803,
                    32.550021,
                  ))),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Align(
                alignment: Alignment.bottomCenter,
                child: ElevatedButton(
                    onPressed: () {},
                    child: const SizedBox(
                        width: 130,
                        height: 50,
                        child: Center(
                            child: Text(
                          "انشاء طلب",
                          style: TextStyle(fontSize: 20),
                        ))))),
          )
        ],
      ),
    );
    // body: Center(
    //   child: Center(
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: [
    //         Text(
    //           "WEBFUN",
    //           style: TextStyle(
    //             color: Colors.indigo[900],
    //             fontSize: 50,
    //           ),
    //         ),
    //         Row(
    //           mainAxisAlignment: MainAxisAlignment.center,
    //           children: [
    //             Text(
    //               "Logout",
    //               style: TextStyle(
    //                 color: Colors.red,
    //                 fontSize: 30,
    //               ),
    //             ),
    //             IconButton(
    //               icon: Icon(Icons.logout),
    //               onPressed: () async {
    //                 await FirebaseAuth.instance.signOut();
    //                 Navigator.pushReplacement(
    //                   context,
    //                   MaterialPageRoute(
    //                     builder: (context) => LoginScreen(),
    //                   ),
    //                 );
    //               },
    //             ),
    //           ],
    //         ),

    //       ],
    //     ),
    //   ),
    // ),
  }
}
