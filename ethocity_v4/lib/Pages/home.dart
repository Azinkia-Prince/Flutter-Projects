import 'package:ethocity_v4/Pages/hacker_rank.dart';
import 'package:ethocity_v4/Pages/gallery.dart';
import 'package:ethocity_v4/Pages/iqac.dart';
import 'package:ethocity_v4/Pages/leetcode.dart';
import 'package:ethocity_v4/Pages/pdf.dart';
import 'package:ethocity_v4/custom_class.dart';
import 'package:ethocity_v4/navPage.dart';
import 'package:ethocity_v4/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ethocity_v4/custom_functions.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ethocity_v4/API Helper/news_helper.dart';

class home extends StatefulWidget {
  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  final clr_obj = clr();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: clr_obj.bg_clr,
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          gap(height: 7),
          CarouselSlider(
              items: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child:
                        Image.asset('assets/images/Untitled design (1).png')),
                ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child:
                        Image.asset('assets/images/Untitled design (2).png')),
                ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child:
                        Image.asset('assets/images/Untitled design (3).png')),
              ],
              options: CarouselOptions(
                  autoPlay: true, height: 120, enableInfiniteScroll: true)),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Text("Quick Links",
                style: txt_style(Colors.white,
                    fnt_sz: 16, fnt_w: FontWeight.bold)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              quick_btn('PDF', FontAwesomeIcons.solidFilePdf, context, pdf()),
              gap(width: 12),
              quick_btn(
                  'Gallery', FontAwesomeIcons.solidImage, context, gallery()),
              gap(width: 12),
              quick_btn(
                  'IQAC', FontAwesomeIcons.solidCircleCheck, context, iqac()),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Text("Contests",
                style: txt_style(Colors.white,
                    fnt_sz: 16, fnt_w: FontWeight.bold)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              quick_btn1('Leet Code', 'assets/images/leetcode.png',
                  Color.fromARGB(255, 250, 230, 115), context, leetcode()),
              gap(width: 15),
              quick_btn1('Hacker Rank', 'assets/images/hackerrank.png',
                  Color.fromARGB(255, 126, 248, 152), context, hacker_rank()),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 17, horizontal: 20),
            child: Text("Trending News 🔥",
                style: txt_style(Colors.white,
                    fnt_sz: 16, fnt_w: FontWeight.bold)),
          ),
          apiSection()
        ],
      )),
    );
  }
}
