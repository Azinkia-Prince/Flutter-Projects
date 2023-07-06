import 'package:flutter/material.dart';
import 'package:movie_app_retry/pages/moviePage.dart';
import 'package:movie_app_retry/pages/tvPage.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _pages = [
    moviePage(),
    tvPage()
  ];

  int _currenIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "TMDB application",
      home: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            setState(() {
              _currenIndex=index;
            });
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.movie),label: "Movie"),
            BottomNavigationBarItem(icon: Icon(Icons.tv),label: "TV"),
          ]
        ),
        body: _pages[_currenIndex],
      ),
    );
  }
}