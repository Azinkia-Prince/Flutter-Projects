import 'package:ethocity_v4/app_drawer.dart';
import 'package:ethocity_v4/custom_class.dart';
import 'package:ethocity_v4/Pages/profile_page.dart';
import 'package:ethocity_v4/custom_functions.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'Pages/home.dart';
import 'Pages/portal.dart';
import 'Pages/routine.dart';

class navPage extends StatefulWidget {
  @override
  State<navPage> createState() => _navPageState();
}

class _navPageState extends State<navPage> {
  final clr_obj = clr();

  int _currentIndex = 0;

  final _pages = [
    home(),
    portal(),
    routine(),
    profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBar(
          automaticallyImplyLeading: false,
          title: Padding(
            padding: const EdgeInsets.only(top: 7),
            child: Text(
              "ETHOCITY",
              style: txt_style(Colors.white, fnt_fam: 'barabara', ltr_space: 1.5),
            ),
          ),
          // centerTitle: true,
          backgroundColor: clr_obj.bg_clr,
          elevation: 10,
          actions: [
            IconButton.outlined(
              onPressed: () {},
              icon: Icon(
                FontAwesomeIcons.solidBell,size: 18,
              ),
              splashRadius: 25,
            ),
            IconButton.outlined(
              onPressed: () {},
              icon: Icon(
                FontAwesomeIcons.phone,size: 18
              ),
              splashRadius: 25,
            ),
            IconButton.outlined(
              onPressed: () {},
              icon: Icon(
                Icons.info,
              ),
              splashRadius: 25,
            ),
          ],
        ),
      ),
      bottomNavigationBar: Theme(
        data: ThemeData(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
            onTap: (value) {
              setState(() {
                _currentIndex = value;
              });
            },
            type: BottomNavigationBarType.fixed,
            backgroundColor: clr_obj.bg_clr,
            elevation: 0,
            unselectedItemColor: Colors.white.withOpacity(0.8),
            selectedItemColor: Colors.white.withOpacity(0.8),
            items: [
              navItem('Home', FontAwesomeIcons.house, 20),
              navItem('Portal', FontAwesomeIcons.tableList, 20),
              navItem('Routine', FontAwesomeIcons.clock, 20),
              navItem('Profile', FontAwesomeIcons.userLarge, 20),
            ]),
      ),
      body: WillPopScope(
        onWillPop: () async {
          exitDialog(context,"Do You Want To Exit?");
          return false;
        } ,
        child: _pages[_currentIndex]),
    );
  }
}
