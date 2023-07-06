import 'package:ethocity_v4/custom_functions.dart';
import 'package:ethocity_v4/Pages/profile_page.dart';
import 'package:ethocity_v4/navPage.dart';
import 'package:ethocity_v4/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_storage/get_storage.dart';

//Firebase-Registration

Registration(mail, pass, context) async {
  final box = GetStorage();
  try {
    final credential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: mail,
      password: pass,
    );
    if (credential.user!.uid.isNotEmpty) {
      box.write('user-email', credential.user!.email);
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => navPage(),
          ));
    } else {
      toast_sms("Something Went Wrong !");
    }
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      toast_sms("The password provided is too weak.");
    } else if (e.code == 'email-already-in-use') {
      toast_sms("The account already exists for that email.");
    }
  } catch (e) {
    toast_sms('$e');
  }
}


//Firebase-SignIn

SignIn(mail,pass,context)async{
  final box = GetStorage();
  try {
  final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: mail,
    password: pass,
  );
  if(credential.user!.uid.isNotEmpty){
    box.write('user-email', credential.user!.email);
    Navigator.push(context, MaterialPageRoute(builder: (context) => navPage(),));
  }
} on FirebaseAuthException catch (e) {
  if (e.code == 'user-not-found') {
    toast_sms("This email is not registered");
  } else if (e.code == 'wrong-password') {
    toast_sms("Wrong Password");
  }
  else{
    toast_sms('$e');
  }
}

}
