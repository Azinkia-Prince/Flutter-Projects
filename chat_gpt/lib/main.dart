import 'package:chat_gpt/provider/modelsProvider.dart';
import 'package:chat_gpt/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => modelsProvider(),)
      ],
      child: MaterialApp(
        title: 'Chat GPT',
        debugShowCheckedModeBanner: false,
        home: homeScreen(),
      ),
    );
  }
}