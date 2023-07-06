import 'package:ethocity_v4/custom_class.dart';
import 'package:ethocity_v4/custom_functions.dart';
import 'package:ethocity_v4/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_storage/get_storage.dart';

class profile extends StatefulWidget {
  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  var clr_obj = clr();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: clr_obj.bg_clr,
      body: SafeArea(
        child: StreamBuilder<Object>(
          stream: FirebaseFirestore.instance.collection('user').doc(FirebaseAuth.instance.currentUser!.email).snapshots(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            var data = snapshot.data;
            return Column(
              children: [
                Stack(
                  alignment: Alignment.center,
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      height: 140,
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius:
                              BorderRadius.vertical(bottom: Radius.circular(35)),),                             
                              child: ClipRRect(
                                borderRadius: BorderRadius.vertical(bottom: Radius.circular(35)),
                                child: Image.asset('assets/images/profile-background.png',fit: BoxFit.cover),
                              ),
                    ),
                    Positioned(
                      bottom: -50,
                      child: CircleAvatar(
                        backgroundColor: clr_obj.bg_clr,
                        radius: 60,
                        child: CircleAvatar(
                          backgroundColor: Color.fromARGB(73, 22, 68, 70),
                          radius: 57,
                          child: IconButton(
                            onPressed: (){}, 
                            icon: Icon(FontAwesomeIcons.userLarge,size: 35)
                            ),
                        ),
                      ),
                    ),
                  ],
                ),
                gap(height: 80),
                Text(data['name'],style: txt_style(Colors.white,fnt_sz: 24,fnt_w: FontWeight.w500)),
                gap(height: 37),
                Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.center,
                  children: [
                    Container(
                      height: 42,
                      width: 125,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(52, 138, 215, 238),
                          border: Border.all(width: 2,color: Color.fromARGB(255, 64, 145, 145)),
                          borderRadius: BorderRadius.circular(30)),
                      child: Center(child: Text(data["dept"],style: txt_style(Color.fromARGB(255, 89, 253, 177),fnt_sz: 22,fnt_w: FontWeight.w500),)),
                    ),
                    Positioned(
                      right: -5,
                      top: -15,
                      child: Container(
                        height: 30,
                        width: 47,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 250, 174, 123),
                            border: Border.all(
                                width: 2, color: Color.fromARGB(171, 39, 55, 107)),
                            borderRadius: BorderRadius.circular(30)),
                        child: Center(child: Text(data["sem"],style: txt_style(Color.fromARGB(255, 18, 12, 51),fnt_sz: 16),)),
                      ),
                    ),
                  ],
                ),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      height: 250,
                    ),
                    Positioned(
                      bottom: 0,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(101, 4, 54, 94),
                          minimumSize: Size(130, 40),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)
                          )
                        ),
                        onPressed: (){
                          logOutDialog(context);
                        }, 
                        child: Text("Log Out")
                      )
                    ),
                  ],
                )
              ],
            );
          }
        ),
      ),
    );
  }
}
