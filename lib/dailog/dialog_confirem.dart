import 'package:flutter/material.dart';

import 'loading_dialog.dart';

class DailogConfirm extends StatefulWidget {
  final String title;
  final String message;
  final Function yesConfiremFun;

  const DailogConfirm(
      {Key? key,
      required this.title,
      required this.message,
      required this.yesConfiremFun})
      : super(key: key);

  @override
  _DailogConfirmState createState() => _DailogConfirmState();
}

class _DailogConfirmState extends State<DailogConfirm> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Dialog(
      child: Container(
        height: size.height * 0.3,
        padding: EdgeInsets.all(size.width * 0.06),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Text(
                  widget.title,
                  textDirection: TextDirection.rtl,
                  style: const TextStyle(
                      color: Colors.green,
                      fontFamily: 'Changa',
                      fontWeight: FontWeight.w700,
                      fontSize: 17),
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                Text(
                  widget.message,
                  style: const TextStyle(
                      color: Colors.black, fontFamily: 'Changa'),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsets>(
                        const EdgeInsets.symmetric(horizontal: 35)),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.red),
                  ),
                  child: const Text(
                    'لا',
                    style: TextStyle(color: Colors.white, fontFamily: 'Changa'),
                  ),
                  onPressed: () {
                    Navigator.of(context, rootNavigator: true).pop();
                  },
                ),
                ElevatedButton(
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all<EdgeInsets>(
                          const EdgeInsets.symmetric(horizontal: 30)),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.green),
                    ),
                    onPressed: () {
                      // popDialogOrScreen(context);
                      // showDialogCustom(context, const DialogLoading());
                      widget.yesConfiremFun();
                    },
                    child: const Text(
                      'نعم',
                      style:
                          TextStyle(color: Colors.white, fontFamily: 'Changa'),
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
