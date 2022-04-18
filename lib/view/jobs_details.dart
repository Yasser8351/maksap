
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:maksap/view/add_order.dart';
import 'package:maksap/view/jobs.dart';
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
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text(""),
        leading: IconButton(onPressed: (){
          Navigator.of(context).pop();
        }, icon:const Icon(Icons.navigate_before,color: Colors.white,size: 35,)),
      ),
            drawer:const AppDrawer(),

            body:      StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection('jobs')
                        .snapshots(),
                    builder: (ctx, AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else {
                        final data = snapshot.data!.docs;
                        
                        return SizedBox(
                          height: size.height - 150,
                          child: ListView.builder(
                            itemCount: data.length,
                            itemBuilder: (ctx, index) {
                              return  Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: buildCardJobs(context: context, icons: Icons.arrow_back_ios, title:                                                 "${data[index]["name"]}", ontTap: (){}),

                              );
                            }
                            
                            
                          ),
                        );
                      }
                    }),
           

    

      
    );
    
  }
}

buildCardJobs( {required BuildContext context,
    required IconData icons,
    required String title,
    required void Function() ontTap

    })
{
        return Card(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: ListTile(
        onTap: () {
          ontTap;
          Navigator.of(context).pushNamed(AddOrder.routeName);
          
        },
      
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
