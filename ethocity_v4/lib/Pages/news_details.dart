import 'package:ethocity_v4/Model/news_model.dart';
import 'package:ethocity_v4/Pages/news_read_more.dart';
import 'package:ethocity_v4/custom_class.dart';
import 'package:ethocity_v4/custom_functions.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class details extends StatelessWidget {
 final clr_obj = clr();
 final NewsModel newsModel;

   details({super.key, required this.newsModel});
  @override
  Widget build(BuildContext context) {
    var newsDesc = newsModel.description.toString();
    return Scaffold(
      appBar: AppBar(
        title: Text("News Description",style: txt_style(Colors.white.withOpacity(0.8),fnt_sz: 18,fnt_w: FontWeight.w500),),
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: clr_obj.bg_clr,
        elevation: 0,
      ),
      backgroundColor: clr_obj.bg_clr,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AspectRatio(
              aspectRatio:18/6.8,
              child: Image.network(newsModel.urlToImage.toString(),width: double.infinity,height: 200,fit: BoxFit.cover,)),
            gap(
              height: 15
            ),
            Expanded(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(43, 4, 54, 94),
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 20),
                    child: Column(
                      children: [
                        Text('$newsDesc.....',textAlign: TextAlign.justify,style: txt_style(Colors.white.withOpacity(0.8),fnt_sz: 13,height: 1.5,),),
                        gap(
                          height: 10
                        ),
                        ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(83, 4, 54, 94)),onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => newsReadMore(newsModel: newsModel),)), child: Text("Read More"))
                      ],
                    ),
                  )),
                ],
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}