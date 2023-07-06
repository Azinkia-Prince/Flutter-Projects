import 'package:ethocity_v4/custom_functions.dart';
import 'package:flutter/material.dart';

class pdf extends StatelessWidget {
  const pdf({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: defaultWebpage(url: 'https://drive.google.com/drive/folders/1ViD6A2Fb0Gu4lP1W4kfqIdaosLkKW1Kr?usp=share_link'));
  }
}