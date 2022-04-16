// import 'package:another_flushbar/flushbar.dart';
// import 'package:flutter/material.dart';

// popDialogOrScreen(BuildContext context) {
//   Navigator.of(context, rootNavigator: true).pop();
// }

// showDialogCustom(BuildContext context, Widget dialog) {
//   showDialog(
//     barrierDismissible: false,
//     context: context,
//     builder: (context) => dialog,
//   );
// }

// Flushbar showFlushbarCustom(
//     {required String massage,
//     required bool status,
//     required int dismissTimeSec,
//     Color? color}) {
//   return Flushbar(
//     backgroundColor: color ?? (status ? Colors.green : Colors.red.shade400),
//     messageText: Text(massage,
//         textAlign: TextAlign.center,
//         style: const TextStyle(color: Colors.white, fontFamily: 'Changa')),
//     duration: const Duration(seconds: 3),
//   );
// }

// class DialogLoading extends StatelessWidget {
//   final String massage;
//   final double elevation;
//   const DialogLoading(
//       {Key? key, this.massage = 'الرجاء الانتظار', this.elevation = 10})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.of(context).size;

//     return Dialog(
//       elevation: elevation,
//       child: Container(
//         padding: EdgeInsets.all(size.width * 0.05),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(massage),
//             SizedBox(
//               width: size.width * 0.03,
//             ),
//             const CircularProgressIndicator(),
//           ],
//         ),
//       ),
//     );
//   }
// }
