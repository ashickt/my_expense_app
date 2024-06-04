import 'package:flutter/material.dart';
import 'package:my_expense_app/screens/account/Accont_screen.dart';

import 'package:my_expense_app/screens/landing/Home_screen.dart';
import 'package:my_expense_app/screens/profile/my_profile.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int _selectedIndex = 0;

  List<String> titles = ['Home', 'Account'];
  List<Widget> screens = [
    HomeScreen(),
    AccountScreen(),
    MyProfile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(titles[_selectedIndex]),
      // ),
      body: SingleChildScrollView(
        child: screens[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (val) {
          setState(() {
            _selectedIndex = val;
          });
        },
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Accounts'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), label: 'My Profile'),
        ],
      ),
    );
  }
}
