import 'package:ethocity_v4/custom_class.dart';
import 'package:ethocity_v4/custom_functions.dart';
import 'package:ethocity_v4/sign_in.dart';
import 'package:ethocity_v4/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class onboarding_1 extends StatelessWidget {
  final clr_obj = clr();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: clr_obj.bg_clr,
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          gap(height: 30),
          Center(
              child: Image.asset(
            "assets/images/onboard.png",
            width: 280,
          )),
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                  child: Text(
                "Welcome!",
                style:
                    txt_style(Colors.white, fnt_sz: 20, fnt_w: FontWeight.bold),
              )),
              gap(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Center(
                  child: Text(
                    "Maintain your daily class routines, check portals and get updates. Proceed...",
                    textAlign: TextAlign.center,
                    style: txt_style(Colors.white,
                        fnt_sz: 16, fnt_w: FontWeight.w500, height: 1.4),
                  ),
                ),
              ),
            ],
          )),
          gap(height: 100),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: quick_btn1('Continue', 'assets/images/right-arrow.png', Colors.white, context, signIn_page())
          )
        ],
      )),
    );
  }
}
