import 'dart:ffi';
import 'dart:ui';
import 'package:ethocity_v4/Model/news_model.dart';
import 'package:ethocity_v4/Pages/news_details.dart';
import 'package:ethocity_v4/custom_class.dart';
import 'package:ethocity_v4/firebase/authentication/auth_helper.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shimmer/shimmer.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'API Helper/news_helper.dart';
import 'package:get_storage/get_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';

var clr_obj = clr();
final box = GetStorage();

TextStyle txt_style(Color clr,
    {double fnt_sz = 16,
    FontWeight fnt_w = FontWeight.normal,
    fnt_fam,
    double? height,
    double? ltr_space}) {
  return TextStyle(
    color: clr,
    fontSize: fnt_sz,
    fontWeight: fnt_w,
    fontFamily: fnt_fam,
    height: height,
    letterSpacing: ltr_space,
  );
}

SizedBox gap({double? height, double? width}) {
  return SizedBox(
    height: height,
    width: width,
  );
}

Container cont(double ht, double wt, {Color? clr, double? rds}) {
  return Container(
    height: ht,
    width: wt,
    decoration:
        BoxDecoration(color: clr, borderRadius: BorderRadius.circular(rds!)),
  );
}

//custom Button

InkWell custom_btn(double ht, double wt, Color clr, double rds, String txt,
    context, Widget page) {
  return InkWell(
    onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => page,
        )),
    child: Container(
      height: ht,
      width: wt,
      decoration: BoxDecoration(
        color: clr,
        borderRadius: BorderRadius.circular(rds),
      ),
      child: Center(
          child: Text(
        txt,
        style: txt_style(Colors.white, fnt_sz: 14, fnt_w: FontWeight.bold),
      )),
    ),
  );
}

Future<bool?> toast_sms(String msg) {
  return Fluttertoast.showToast(
      msg: msg,
      backgroundColor: Color.fromARGB(255, 20, 92, 102),
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM);
}

BottomNavigationBarItem navItem(label, icon, double size) {
  return BottomNavigationBarItem(
    icon: Icon(
      icon,
      size: size,
    ),
    label: label,
  );
}

FloatingActionButton quick_btn(text, icon, context, Widget link) {
  return FloatingActionButton.extended(
    label: Text(text),
    onPressed: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => link,
        )),
    icon: Icon(
      icon,
      size: 21,
    ),
    backgroundColor: Color.fromARGB(43, 4, 54, 94),
  );
}

FloatingActionButton quick_btn1(text, icon, clr, context, Widget link) {
  return FloatingActionButton.extended(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    splashColor: Color.fromARGB(255, 4, 28, 48),
    label: Text(text),
    onPressed: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => link,
        )),
    icon: ImageIcon(
      AssetImage(icon),
      size: 21,
      color: clr,
    ),
    backgroundColor: Color.fromARGB(43, 4, 54, 94),
  );
}

//shimmer layout

shimmer_layout() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      CircleAvatar(
        radius: 25,
      ),
      SizedBox(width: 20),
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          cont(40, 250, clr: Colors.blue, rds: 10),
          gap(height: 7),
          cont(30, 150, clr: Colors.blue, rds: 10),
          gap(height: 12),
        ],
      )
    ],
  );
}

//shimmer effect

Container shimmer_effect() {
  return Container(
    height: 600,
    width: 340,
    child: Shimmer.fromColors(
      baseColor: Color(0xff202F3D),
      highlightColor: Color.fromARGB(109, 121, 122, 124),
      child: ListView.builder(
        itemBuilder: (context, index) {
          return shimmer_layout();
        },
        itemCount: 6,
      ),
    ),
  );
}

//default Webview

class defaultWebpage extends StatefulWidget {
  defaultWebpage({Key? key, required this.url}) : super(key: key);
  String url;
  @override
  State<defaultWebpage> createState() => _defaultWebpageState();
}

class _defaultWebpageState extends State<defaultWebpage> {
  int position = 1;
  @override
  WebViewController? controller;
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (await controller!.canGoBack()) {
          controller?.goBack();
          return false;
        } else {
          return true;
        }
      },
      child: IndexedStack(
        index: position,
        children: [
          WebView(
              initialUrl: widget.url,
              javascriptMode: JavascriptMode.unrestricted,
              onPageStarted: (value) {
                setState(() {
                  position = 1;
                });
              },
              onPageFinished: (value) {
                setState(() {
                  position = 0;

                  controller?.evaluateJavascript(
                      "document.getElementsByClassName('header')[0].style.display='none'");

                  controller?.evaluateJavascript(
                      "document.getElementsByClassName('navbar-wrapper')[0].style.display='none'");

                  controller?.evaluateJavascript(
                      "document.getElementsByClassName('bg-theme-colored')[0].style.background='radial-gradient(black, transparent)'");

                  controller?.evaluateJavascript(
                      "document.getElementsByClassName('parallax')[2].style.display='none';");

                  controller?.evaluateJavascript(
                      "document.getElementsByClassName('inner-header')[0].style.display='none'");

                  controller?.evaluateJavascript(
                      "document.getElementsByClassName('.main-header.style-two')[0].style.display='none'");
                });
              },
              onWebViewCreated: (controller) {
                this.controller = controller;
              }),
          Container(
            child: Center(
              child: shimmer_effect(),
            ),
          )
        ],
      ),
    );
  }
}

SizedBox custom_card(Widget link, context, leading_icon, trailing_icon, txt) {
  return SizedBox(
      width: 295,
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        color: Color.fromARGB(82, 4, 54, 94),
        child: ListTile(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => link,
              )),
          leading: Icon(
            leading_icon,
            color: Colors.white.withOpacity(0.8),
            size: 20,
          ),
          trailing: Icon(trailing_icon, color: Colors.white.withOpacity(0.8)),
          title: Text(
            txt,
            style: txt_style(Colors.white.withOpacity(0.8),
                fnt_sz: 18, fnt_w: FontWeight.bold),
          ),
        ),
      ));
}

//API Section

Expanded apiSection() {
  return Expanded(
    child: FutureBuilder(
      future: fetchNews(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<NewsModel>newsList = snapshot.data??[];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: RefreshIndicator(
              onRefresh: () async {
                return Future<void>.delayed(const Duration(seconds: 1));
              },
              
              backgroundColor:Color.fromARGB(249, 2, 24, 43),
              color: Colors.white,
              strokeWidth: 2,
              displacement: 20,
              child: ListView.builder(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemCount: newsList.length,
                itemBuilder: (context, index) {
                  var news_source = newsList[index].source.name.toString();
                  return ListTile(
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => details(newsModel: newsList[index]),)),
                    leading: newsList[index].urlToImage == null ? Image.asset('assets/images/no_image.png',width: 90,fit: BoxFit.cover) : Image.network(newsList[index].urlToImage.toString(),width: 90,fit: BoxFit.cover,),
                    title: Text(newsList[index].title.toString(),textDirection: TextDirection.ltr,style: txt_style(Colors.white,fnt_sz: 12),),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Text("সোর্স : $news_source",style: txt_style(Colors.white.withOpacity(0.8),fnt_sz: 10),),
                    ),
                  );
                },
              ),
            ),
          );
        }
        return Center(
          child: shimmer_effect(),
        );
      },
    ),
  );
}


//Exit Dialog

exitDialog(context,String txt){
  showDialog(
    context: context, 
    builder: (context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 5,
        alignment: Alignment.center,
        backgroundColor: clr_obj.bg_clr,
        child: Container(
          height: 130,
          child: Column(
            mainAxisAlignment:MainAxisAlignment.center,
            children: [
              Text("Do You Want To Exit?",style: txt_style(Colors.white.withOpacity(0.8),fnt_sz: 16,fnt_w: FontWeight.bold),),
              gap(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(101, 4, 54, 94),), onPressed: ()=>SystemNavigator.pop(), child: Text("Yes")),
                  gap(width: 15),
                  ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(101, 4, 54, 94),), onPressed: ()=>Navigator.pop(context), child: Text("No")),
                
                ],
              )
            ],
          ),
        ),
      );
    },
  );
}


//Log Out Dialog

logOutDialog(context){
  showDialog(

    context: context, 
    builder: (context) {
      return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 2,sigmaY: 2),
        child: Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 5,
          alignment: Alignment.center,
          backgroundColor: clr_obj.bg_clr,
          child: Container(
            height: 130,
            child: Column(
              mainAxisAlignment:MainAxisAlignment.center,
              children: [
                Text("Log Out?",style: txt_style(Colors.white.withOpacity(0.8),fnt_sz: 16,fnt_w: FontWeight.bold),),
                gap(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(101, 4, 54, 94),), onPressed: (){
                      SystemNavigator.pop();
                      box.remove('user-email');
                      FirebaseAuth.instance.signOut();
                    }, child: Text("Yes")),
                    gap(width: 15),
                    ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(101, 4, 54, 94),), onPressed: ()=>Navigator.pop(context), child: Text("No")),
                  
                  ],
                )
              ],
            ),
          ),
        ),
      );
    },
  );
}