
import 'package:flutter/material.dart';
import 'package:maksap/view/add_order.dart';
import 'package:maksap/widget/app_drawer.dart';

class JobDetails extends StatefulWidget {
  const JobDetails({Key? key}) : super(key: key);
  static const routeName = "JobDetails";

  @override
  State<JobDetails> createState() => _JobDetailsState();
}

class _JobDetailsState extends State<JobDetails> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(""),
        // leading: IconButton(onPressed: (){
        //   Navigator.of(context).pop();
        // }, icon:const Icon(Icons.navigate_before,color: Colors.white,size: 35,)),
      ),
            drawer:const AppDrawer(),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Text(
                    "تحديد الخدمة",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 20,
                    ),
                  ),
          ),
          Card(
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: ListTile(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (ctx) => const AddOrder()));
              },
              leading: Icon(
                Icons.navigate_before,
                size: 35,
                color: Theme.of(context).colorScheme.primary,
              ),
              trailing  : Padding(
                padding: const EdgeInsets.only(right: 3, left: 3),
                child: Text(
                  "سباكة",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
        
          Card(
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: ListTile(
              onTap: () {
                // Navigator.of(context).push(
                //     MaterialPageRoute(builder: (ctx) => const ShowStatus()));
              },
              leading: Icon(
                Icons.navigate_before,
                size: 35,
                color: Theme.of(context).colorScheme.primary,
              ),
              trailing  : Padding(
                padding: const EdgeInsets.only(right: 3, left: 3),
                child: Text(
                  "كهرباء",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
        
          Card(
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: ListTile(
              onTap: () {
                // Navigator.of(context).push(
                //     MaterialPageRoute(builder: (ctx) => const ShowStatus()));
              },
              leading: Icon(
                Icons.navigate_before,
                size: 35,
                color: Theme.of(context).colorScheme.primary,
              ),
              trailing  : Padding(
                padding: const EdgeInsets.only(right: 3, left: 3),
                child: Text(
                  "تكييف وتبريد",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
        
          Card(
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: ListTile(
              onTap: () {
                // Navigator.of(context).push(
                //     MaterialPageRoute(builder: (ctx) => const ShowStatus()));
              },
              leading: Icon(
                Icons.navigate_before,
                size: 35,
                color: Theme.of(context).colorScheme.primary,
              ),
              trailing  : Padding(
                padding: const EdgeInsets.only(right: 3, left: 3),
                child: Text(
                  "حدادة",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
        
        ],
      ),

      
    );
  }
}
