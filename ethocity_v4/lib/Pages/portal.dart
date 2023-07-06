import 'package:ethocity_v4/custom_class.dart';
import 'package:ethocity_v4/custom_functions.dart';
import 'package:flutter/material.dart';

class portal extends StatelessWidget {
final clr_obj = clr();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: clr_obj.bg_clr,
      body: SafeArea(
        child: Center(
          child: Container(
            child: defaultWebpage(url: "https://webportal.ugv.edu.bd/LoginPage.aspx")
          ),
        )
      ),

    );
  }
}