import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import '../dashboard.dart';
import 'Settings.dart';
import 'TeachersList.dart';

class NavPage extends StatefulWidget {
  const NavPage({super.key});

  @override
  State<NavPage> createState() => _NavPageState();
}

class _NavPageState extends State<NavPage> {

  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  int _page=0;


  final screens = [

    Dashboard(),
    const Teacherslist(),
    const SettingsPage(),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: CurvedNavigationBar(


        key: _bottomNavigationKey,
        backgroundColor: Colors.transparent,
        color:  Color(0xff080637),
        animationDuration: const Duration(milliseconds: 300),

        onTap: (index) {
          print(index);
          setState(() {
            _page = index;
          });
        },

        items: const [
          Icon(Icons.home,
            color: Colors.white,),
          Icon(Icons.perm_contact_cal,
            color: Colors.white,),
          Icon(Icons.settings,
            color: Colors.white,)
        ],
      ),
      body:  screens[_page],

    );
  }
}
