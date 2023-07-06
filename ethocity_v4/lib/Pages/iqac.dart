import 'package:ethocity_v4/custom_functions.dart';
import 'package:flutter/material.dart';

class iqac extends StatelessWidget {
  const iqac({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: defaultWebpage(url: 'https://ecourse.ugvedu.com/ClassAttendance'));
  }
}