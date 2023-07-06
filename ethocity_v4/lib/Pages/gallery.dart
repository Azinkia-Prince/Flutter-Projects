import 'package:ethocity_v4/custom_functions.dart';
import 'package:flutter/material.dart';

class gallery extends StatelessWidget {
  const gallery({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: defaultWebpage(url: 'https://ugv.edu.bd/gallery'));
  }
}