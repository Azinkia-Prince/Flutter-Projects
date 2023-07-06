import 'package:ethocity_v4/API%20Helper/news_helper.dart';
import 'package:ethocity_v4/Model/news_model.dart';
import 'package:ethocity_v4/custom_class.dart';
import 'package:flutter/material.dart';

class routine extends StatefulWidget {
  @override
  State<routine> createState() => _routineState();
}

class _routineState extends State<routine> {
final clr_obj = clr();
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: clr_obj.bg_clr,
      body: SafeArea(
        child: Center(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Image.asset('assets/images/Add a little bit of body text.png',fit: BoxFit.cover,),
          ),
        )
      ),

    );
  }
}