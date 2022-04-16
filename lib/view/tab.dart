import 'package:flutter/material.dart';
import 'about_app.dart';
import 'google_map_screen.dart';
import 'myorder.dart';


class TabScreen extends StatefulWidget {
  const TabScreen({Key? key}) : super(key: key);
  static const routeName = "TabScreen";

  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  DateTime timeBackPressed = DateTime.now();
  final List<Widget> _pages = [
    const AboutApp(),
    const MyOrder(),
    const GoogleMapScreen(),

  ];
  int _currentPage = 2;
  void _selectedPage(int index) {
    setState(() {
      _currentPage = index;
    });
   
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: WillPopScope(
              onWillPop: () async {
                final differenc = DateTime.now().difference(timeBackPressed);
                final exitApp = differenc >=const Duration(seconds: 2);

                timeBackPressed = DateTime.now();

                if (exitApp) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Theme.of(context).primaryColor,
                      duration: const Duration(seconds: 2),
                      content: const Text(
                        "اضغط مرة أخري للخروج",
                        textAlign: TextAlign.right,
                      ),
                    ),
                  );
                  return false;
                } else {
                  return true;
                }
              },
              child: Scaffold(
                body: _pages[_currentPage],
                bottomNavigationBar: BottomNavigationBar(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  onTap: _selectedPage,
                  selectedItemColor: Colors.black,
                  unselectedItemColor: Colors.white,
                  currentIndex: _currentPage,
                  items: [
                      BottomNavigationBarItem(
                      label: "نبذة عن الفنيين",
                      backgroundColor: Colors.white,
                      icon: Icon(
                        Icons.info,
                        color: _currentPage == 0 ? Colors.black : Colors.white,
                      ),
                    ),
                  
                    BottomNavigationBarItem(
                      label: "الطلبات الحالية",
                      backgroundColor: Colors.white,
                      icon: Icon(
                        Icons.indeterminate_check_box_rounded,
                        color: _currentPage == 1 ? Colors.black : Colors.white,
                      ),
                    ),
                    BottomNavigationBarItem(
                      label: "طلب جديد",
                      backgroundColor: Colors.white,
                      icon: Icon(
                        Icons.location_on,
                        color: _currentPage == 2 ? Colors.black : Colors.white,
                      ),
                    ),
                 
                  
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
