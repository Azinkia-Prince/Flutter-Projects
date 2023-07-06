import 'package:ethocity_v4/Pages/home.dart';
import 'package:ethocity_v4/Pages/routine.dart';
import 'package:ethocity_v4/navPage.dart';
import 'package:ethocity_v4/onboarding_1.dart';
import 'package:ethocity_v4/Pages/profile_page.dart';
import 'package:ethocity_v4/sign_in.dart';
import 'package:ethocity_v4/sign_up.dart';
import 'package:ethocity_v4/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Ethocity",
      home: Scaffold(
        // appBar: AppBar(
        //   title: Text("ETHOCITY"),
        //   centerTitle: true,
        // ),
        body: mainScrn(),
      ),
    );
  }
}

class mainScrn extends StatelessWidget {
  const mainScrn({super.key});

  @override
  Widget build(BuildContext context) {
    return splash();
  }
}
