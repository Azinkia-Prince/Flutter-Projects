import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class home extends StatelessWidget {
  List catergoties = [
    'Food',
    'Electronics',
    'Groceries',
    'Clothings',
    'Men',
    'Women',
    'Children'
  ];

  var productJason = [
    {"ProductN": "Men Watch", "description": 'Sereies - 5 Watch'},
    {"ProductN": "Rist Watch", "description": 'Sereies - 6 Watch'},
    {"ProductN": "Women Watch", "description": 'Sereies - 7 Watch'},
    {"ProductN": "Ladies Watch", "description": 'Sereies - 8 Watch'},
    {"ProductN": "Child Watch", "description": 'Sereies - 9 Watch'},
    {"ProductN": "Indian Watch", "description": 'Sereies - 10 Watch'},
    {"ProductN": "Bangladeshi Watch", "description": 'Sereies - 11 Watch'},
    {"ProductN": "Pakistani Watch", "description": 'Sereies - 12 Watch'},
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(
          left: 25,
          top: 45,
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hello Azinkia Prince !",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w500
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Text("Let's Do Some Shopping..."),
              SizedBox(
                height: 30,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 13),
                      child: Container(
                        height: 120,
                        width: 270,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 53, 230, 127),
                            borderRadius: BorderRadius.circular(12)),
                        child: Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 15, left: 12),
                              child: Text(
                                "40% Off During \n Covid 19",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Color.fromARGB(255, 78, 112, 224),
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            Positioned(
                              child: Image.asset(
                                "assets/image1.png",
                                width: 140,
                              ),
                              bottom: 0,
                              right: 0,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 13),
                      child: Container(
                        height: 120,
                        width: 270,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 156, 235, 218),
                            borderRadius: BorderRadius.circular(12)),
                        child: Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 15, left: 12),
                              child: Text(
                                "40% Off During \n Covid 19",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Color.fromARGB(255, 29, 106, 136),
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            Positioned(
                              child: Image.asset(
                                "assets/image2.png",
                                width: 140,
                              ),
                              bottom: 0,
                              right: 0,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 13),
                      child: Container(
                        height: 120,
                        width: 270,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 59, 91, 179),
                            borderRadius: BorderRadius.circular(12)),
                        child: Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 15, left: 12),
                              child: Text(
                                "40% Off During \n Covid 19",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Color.fromARGB(255, 199, 157, 68),
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            Positioned(
                              child: Image.asset(
                                "assets/image3.png",
                                width: 140,
                              ),
                              bottom: 0,
                              right: 0,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                padding: EdgeInsets.only(right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Top Categories",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      "View All",
                      style: TextStyle(fontSize: 16, color: Colors.deepOrange),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 70,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: catergoties.length,
                  itemBuilder: (context, index) {
                    return Center(
                      child: Container(
                          margin: EdgeInsets.only(left: 10),
                          padding:
                              EdgeInsets.symmetric(horizontal: 30, vertical: 8),
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(50)),
                          child: Text(
                            catergoties[index],
                            style: TextStyle(fontSize: 18),
                          )),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                height: 500,
                child: GridView.builder(
                   
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                    itemBuilder: (context, index) {
                      return Container(
                        
                        color: Colors.black,

                        child: ListTile(
                          title: Text(productJson[index]['ProductN'].toString),
                          
                        ),
                      );
                    },),
              )
            ],
          ),
        ),
      ),
    );
  }
}
