
import 'package:flutter/material.dart';
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
        title: const Text("اختر الخدمة"),
        // leading: IconButton(onPressed: (){
        //   Navigator.of(context).pop();
        // }, icon:const Icon(Icons.navigate_before,color: Colors.white,size: 35,)),
      ),
            drawer:const AppDrawer(),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
         
          buildCardItem(title: "خدمات الصيانة",description: "تشمل اعمال الكهرباء والسباكة والتكييف",icons: Icons.account_circle_outlined,context: context,ontTap: (){
            Navigator.of(context).pushNamed(JobDetails.routeName);
          }),
          buildCardItem(title: "خدمات النظافة",description: "تشمل نظافة المنازل وغسيل وكوي الملابس",icons: Icons.account_tree_rounded,context: context,ontTap: (){
            Navigator.of(context).push(
              MaterialPageRoute(builder: (ctx) => const JobDetails()));
          }),
          buildCardItem(title: "خدمات التجميل",description: "تشمل الحنة والمكياج المنزلي",icons: Icons.ad_units_rounded,context: context,ontTap: (){
            Navigator.of(context).push(
              MaterialPageRoute(builder: (ctx) => const JobDetails()));
          }),
          buildCardItem(title: "خدمات البناء والديكور",description: "تشمل النقاشة واللياسة والنجارة والمقاولات",icons: Icons.add_road_sharp,context: context,ontTap: (){
            Navigator.of(context).push(
              MaterialPageRoute(builder: (ctx) => const JobDetails()));
          }), 
          buildCardItem(title: "خدمات التدريس والتدريب",description: "اطلب مدرسك الخصوصي وتابع دروسك",icons: Icons.ac_unit,context: context,ontTap: (){
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
    required String description,
    required void Function() ontTap

    })
{
        return Card(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: ListTile(
          onTap: () {
            ontTap;
              Navigator.of(context).pushNamed(JobDetails.routeName);
            
          },
          trailing:   Icon(
                icons,
                              color: Theme.of(context).colorScheme.primary,
                              size: 45,

              ),
          title  : Padding(
            padding: const EdgeInsets.only(right: 3, left: 3),
            child: Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                color: Theme.of(context).colorScheme.primary,
                fontSize: 18,
              ),
                          textAlign: TextAlign.right,

            ),
          ),
     
     subtitle: Text(
              description,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                color: Theme.of(context).colorScheme.primary,
                fontSize: 16,
              ),
              textAlign: TextAlign.right,
            ),
        ),
      ),
    );
}