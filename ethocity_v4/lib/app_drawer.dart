import 'package:ethocity_v4/Pages/profile_page.dart';
import 'package:ethocity_v4/custom_class.dart';
import 'package:ethocity_v4/custom_functions.dart';
import 'package:ethocity_v4/navPage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class appDrawer extends StatelessWidget {
 final clr_obj = clr();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: clr_obj.bg_clr,
      child: Column(
        children: [
          DrawerHeader(
            child: Center(
              child: Image.asset(
                "assets/images/ugv.png",
              ),
            ),
            decoration:
                BoxDecoration(color: Color.fromARGB(255, 155, 203, 248)),
          ),
          custom_card(navPage(), context, FontAwesomeIcons.phone, FontAwesomeIcons.circleArrowRight, 'Contact - UGV'),
          custom_card(navPage(), context, FontAwesomeIcons.fileCircleExclamation, FontAwesomeIcons.circleArrowRight, 'About - UGV'),
        ],
      ),
    );
  }
}
