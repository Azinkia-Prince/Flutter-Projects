import 'package:flutter/material.dart';
import 'package:prject_1/pages/account.dart';
import 'package:prject_1/pages/add.dart';
import 'package:prject_1/pages/chat.dart';
import 'package:prject_1/pages/home.dart';
import 'package:prject_1/pages/my_ads.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex =0;

  final allpages = [
    home(),
    add(),
    chat(),
    myAds(),
    account(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Project - 1",
      home: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          
          onTap: (value) {
           setState(() {
              _currentIndex = value;
           });
          },
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_outlined,
                ),
                label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.shopping_bag_outlined,
                ),
                label: "My Ads"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.add_circle_outline_rounded,
                ),
                label: "Add"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.chat_outlined,
                ),
                label: "Chat"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.account_circle_outlined,
                ),
                label: "Account"),
          ],
          selectedItemColor: Colors.purple,
          unselectedItemColor: Colors.grey,
          selectedFontSize: 13,
        ),

        body: allpages[_currentIndex],
      ),
    );
  }
}
