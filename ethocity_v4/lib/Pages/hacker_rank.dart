import 'package:ethocity_v4/custom_functions.dart';
import 'package:flutter/material.dart';

class hacker_rank extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: defaultWebpage(url: 'https://www.hackerrank.com/contests'));
  }
}