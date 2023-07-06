import 'package:ethocity_v4/custom_functions.dart';
import 'package:flutter/material.dart';

class leetcode extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: defaultWebpage(url: 'https://leetcode.com/contest/'));
  }
}