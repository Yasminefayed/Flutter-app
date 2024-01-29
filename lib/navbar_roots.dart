import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled3/Registerpage.dart';
import 'package:untitled3/Welcome_page.dart';
import 'package:untitled3/diary.dart';
import 'package:untitled3/dummy.dart';
import 'package:untitled3/login&signup.dart';
import 'package:untitled3/login.dart';
import 'package:untitled3/rec1.dart';
import 'package:untitled3/recommendation1.dart';
import 'package:untitled3/signout.dart';

class NavBarRoots extends StatefulWidget {
  @override
  State<NavBarRoots> createState() => _NavBarRootsState();
}

class _NavBarRootsState extends State<NavBarRoots> {
  int _selectedIndex = 0;
  final _screens = [
    //pages when click on icons
    dummy(),
    DiaryPage(),
    rec(),
    signout(),

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
          selectedItemColor: Color(0xffb11226),
          unselectedItemColor: Colors.black26,
          selectedLabelStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
          currentIndex: _selectedIndex,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_filled), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(
                  CupertinoIcons.eye_slash,
                ),
                label: "My Diary"),
            BottomNavigationBarItem(
                icon: Icon(Icons.assignment_sharp), label: "Recommendations"),
            BottomNavigationBarItem(
                icon: Icon(Icons.logout_rounded), label: "Sign Out"),

          ],
        ),
      ),
    );
  }
}