
import 'package:flutter/material.dart';
import 'package:maksap/view/add_order.dart';
import 'package:maksap/view/jobs_details.dart';
import 'package:maksap/widget/app_drawer.dart';

class Jobs extends StatefulWidget {
  const Jobs({Key? key}) : super(key: key);
  static const routeName = "Jobs";

  @override
  State<Jobs> createState() => _JobsState();
}

class _JobsState extends State<Jobs> {

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
          buildCardItem(title: "سباكة",icons: Icons.account_circle_outlined,context: context,ontTap: (){
            Navigator.of(context).push(
              MaterialPageRoute(builder: (ctx) => const JobDetails()));
          }),
          buildCardItem(title: "كهرباء",icons: Icons.account_tree_rounded,context: context,ontTap: (){
            Navigator.of(context).push(
              MaterialPageRoute(builder: (ctx) => const JobDetails()));
          }),
          buildCardItem(title: "تكييف وتبريد",icons: Icons.ad_units_rounded,context: context,ontTap: (){
            Navigator.of(context).push(
              MaterialPageRoute(builder: (ctx) => const JobDetails()));
          }),
          buildCardItem(title: "حدادة",icons: Icons.add_road_sharp,context: context,ontTap: (){
            Navigator.of(context).push(
              MaterialPageRoute(builder: (ctx) => const JobDetails()));
          }), 
          buildCardItem(title: "خدمات النظافة",icons: Icons.ac_unit,context: context,ontTap: (){
            Navigator.of(context).push(
              MaterialPageRoute(builder: (ctx) => const JobDetails()));
          }), 
        ],
      ),

      
    );
  }
}


buildCardItem( {required BuildContext context,
    required IconData icons,
    required String title,
        required void Function() ontTap

    })
{
        return Card(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: ListTile(
        onTap: () {
          ontTap;
          
        },
        leading:   Icon(
              icons,
              color: Colors.white,
            ),
        trailing  : Padding(
          padding: const EdgeInsets.only(right: 3, left: 3),
          child: Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              color: Theme.of(context).colorScheme.primary,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
}