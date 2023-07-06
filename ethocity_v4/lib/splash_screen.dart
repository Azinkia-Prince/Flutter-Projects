import 'dart:async';
import 'package:ethocity_v4/custom_class.dart';
import 'package:ethocity_v4/navPage.dart';
import 'package:ethocity_v4/onboarding_1.dart';
import 'package:ethocity_v4/sign_in.dart';
import 'package:ethocity_v4/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ethocity_v4/firebase/authentication/auth_helper.dart';

class splash extends StatelessWidget {
  var clr_obj = clr();
  final box = GetStorage();

  chooseScreen(context) async {
    var readData = await box.read('user-email');
    if (readData!=null) {
      return Navigator.push(context, MaterialPageRoute(builder: (context) => navPage(),));
    }
    else{
      return Navigator.push(context, MaterialPageRoute(builder: (context) => signIn_page(),));
    }
  }
  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 1),()=> chooseScreen(context));
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: clr_obj.bg_clr),
        child: Center(
          child: Image.asset("assets/images/ethocity_logo.png",width: 250,)
          ),
      ),
    );
  }
}
