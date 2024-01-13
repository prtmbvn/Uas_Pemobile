import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/About.dart';
import 'package:flutter_application_1/CurrencyConvert.dart';
import 'package:flutter_application_1/Home.dart';
import 'package:flutter_application_1/DataGempa.dart';



class NavBarRoots extends StatefulWidget {
  const NavBarRoots({super.key});
  @override
  State<NavBarRoots> createState() => _NavBarRootsState();
}

class _NavBarRootsState extends State<NavBarRoots> {
   int _selectedIndex = 0;
  final _screens = [
    HomeScreen(),
    CurrencyConverter(),
    BiodataPage(),
    EarthquakePage(),
    
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _screens[_selectedIndex],
      bottomNavigationBar: Container(
        height: 80,
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Color(0xFF7165D6),
          unselectedItemColor: Colors.black26,
          selectedLabelStyle: TextStyle(
            fontWeight:   FontWeight.bold,
            fontSize: 15,
          ),
          currentIndex: _selectedIndex,
          onTap: (index){
            setState(() {
              _selectedIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_filled),
              label:"Home",
              ),
              BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.chat_bubble_text_fill),
              label:"Currency Convert",
              ),
              BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label:"about",
              ),
              BottomNavigationBarItem(
              icon: Icon(Icons.add_chart),
              label:"Data Gempa",
              ),
          ],
        ),
      ),
    );
  }
}