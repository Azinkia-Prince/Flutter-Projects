import 'package:flutter/material.dart';
import 'package:project_2/pages/account.dart';
import 'package:project_2/pages/add.dart';
import 'package:project_2/pages/chat.dart';
import 'package:project_2/pages/home.dart';
import 'package:project_2/pages/my_ads.dart';
void main(){
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex =0;

  final _pages = [
    home(),
    my_ad(),
    add(),
    chat(),
    account(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Project - 2',
      home: Scaffold(
        //Bottom Nav Bar
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.purple,
          unselectedItemColor: Colors.grey,
          selectedFontSize: 13,
          currentIndex: _currentIndex,
          onTap: (value) {
            setState(() {
              _currentIndex = value;
            });
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home_outlined),label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.shopping_bag_outlined),label: 'My Ads'),
            BottomNavigationBarItem(icon: Icon(Icons.add_circle_outline),label: 'Add'),
            BottomNavigationBarItem(icon: Icon(Icons.chat_bubble_outline),label: 'Chat'),
            BottomNavigationBarItem(icon: Icon(Icons.account_circle_outlined),label: 'Account'),
          ]
        ),
        //Body Content

        body: _pages[_currentIndex],
      ),
    );
  }
}