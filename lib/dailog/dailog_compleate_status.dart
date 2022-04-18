import 'package:flutter/material.dart';


///DAilog to show the complete status success or failed
///pop automatic depend on the sec

class DialogCompleteStatus extends StatefulWidget {
  final bool status;
  final String massage;
  final int dismissTimeSec;
  final Function()? onComplete;

  DialogCompleteStatus(
      {Key? key,
      required this.massage,
      required this.status,
      required this.dismissTimeSec,
      this.onComplete})
      : super(key: key);

  @override
  State<DialogCompleteStatus> createState() => _DialogCompleteStatusState();
}

class _DialogCompleteStatusState extends State<DialogCompleteStatus> {
  // final List<String> message = [
  //   'تم بنجاح',
  //   'حدث خطأ الرجاء المحاوله مرة اخرى',
  // ];

  final List<String> statusImage = ['assets/check.png', 'assets/no_item.png'];

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    await Future.delayed(Duration(seconds: widget.dismissTimeSec));
    // popDialogOrScreen(context);
    widget.onComplete!();
  }

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
                  widget.massage,
                  overflow: TextOverflow.clip,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: widget.status ? Colors.green : Colors.red.shade400,
                      fontFamily: 'Changa',
                      fontWeight: FontWeight.w700,
                      fontSize: 17),
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
              ],
            ),
            Image.asset(
              widget.status ? statusImage[0] : statusImage[1],
              fit: BoxFit.fitHeight,
              height: 50,
              width: 50,
            )
          ],
        ),
      ),
    );
  }
}
