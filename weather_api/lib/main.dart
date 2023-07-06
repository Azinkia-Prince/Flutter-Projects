import 'package:flutter/material.dart';
import 'package:weather_api/components/background.dart';
import 'package:weather_api/components/dailyUpdate.dart';
import 'package:weather_api/components/functions.dart';
import 'package:weather_api/components/hourlyUpdate.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String searchText ='auto:ip';

  TextEditingController _searchTextController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'weather app',
      home: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
        child: Scaffold(
          backgroundColor: Color.fromARGB(216, 49, 49, 49),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,                
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          customText("WEATHER",fontSz: 20,fontWd: FontWeight.bold,color: Colors.white),
                          Row(
                            children: [
                              SizedBox(
                                width: 170, 
                                height: 35,
                                child: TextField(
                                  controller: _searchTextController,
                                  style: TextStyle(color: Colors.white.withOpacity(0.8)),
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(50),borderSide: BorderSide(color: Colors.white.withOpacity(0.8),width: 1.5)),
                                    focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(50),borderSide: BorderSide(color: Colors.white.withOpacity(0.8),width: 1.5)),
                                    fillColor: Color.fromARGB(112, 73, 73, 73),
                                    filled: true,
                                    contentPadding: EdgeInsets.symmetric(horizontal: 15),
                                    hintText: "Search",
                  
                                    suffixIcon: IconButton(
                                      onPressed: (){
                                        if (_searchTextController.text.isEmpty) {
                                          return;
                                        }
                                        else{
                                          setState(() {
                                          searchText = _searchTextController.text;
                                        });
                                        FocusManager.instance.primaryFocus!.unfocus();
                                        _searchTextController.clear();
                                        } 
                                    }, 
                                    icon: Icon(Icons.search,color: Colors.white.withOpacity(0.8),size: 22,)),
                                    hintStyle: TextStyle(color: Colors.white)
                                  ),
                                )
                              ),
                              IconButton(
                                onPressed: (){
                                  setState(() {
                                    searchText='auto:ip';
                                  });    
                                }, 
                              icon: Icon(Icons.my_location_outlined,color: Colors.white.withOpacity(0.8),))
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  background(searchText: searchText),
                  headingText('Hourly Update',size: 18,),
                  Padding(
                    padding: const EdgeInsets.only(left:5),
                    child: hourlyUpdate(searchText: searchText),
                  ),
                  
                  
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
