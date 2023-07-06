import 'package:ethocity_v4/Model/news_model.dart';
import 'package:ethocity_v4/custom_functions.dart';
import 'package:flutter/material.dart';

class newsReadMore extends StatelessWidget {
  final NewsModel newsModel;
  const newsReadMore({super.key,required this.newsModel});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: defaultWebpage(url: newsModel.url.toString()));
  }
}