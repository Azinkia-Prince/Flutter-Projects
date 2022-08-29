import 'package:flutter/material.dart';
import 'package:project_2/pages/my_ads.dart';

class home extends StatelessWidget {

  final _categories = ['Food', 'Electronics', 'Groceries', 'Clothes', 'Shoes', 'Children', 'Men', 'Ladies'];

  static List productList= [
    {'ProductN': 'Apple Watch','Description':'Sereies 6.Red','Price':'\$500'},
    {'ProductN': 'Apple Watch','Description':'Sereies 6.Red','Price':'\$500'},
    {'ProductN': 'Apple Watch','Description':'Sereies 6.Red','Price':'\$500'},
    {'ProductN': 'Apple Watch','Description':'Sereies 6.Red','Price':'\$500'},
    {'ProductN': 'Apple Watch','Description':'Sereies 6.Red','Price':'\$500'},
    {'ProductN': 'Apple Watch','Description':'Sereies 6.Red','Price':'\$500'},
    {'ProductN': 'Apple Watch','Description':'Sereies 6.Red','Price':'\$500'},
    {'ProductN': 'Apple Watch','Description':'Sereies 6.Red','Price':'\$500'},
    {'ProductN': 'Apple Watch','Description':'Sereies 6.Red','Price':'\$500'},
    {'ProductN': 'Apple Watch','Description':'Sereies 6.Red','Price':'\$500'},

  ];


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 35, left: 25),
          child: Column(
            children: [
              //Hello Text
              ListTile(
                contentPadding: EdgeInsets.only(bottom: 14),
                title: Text(
                  "Hello Azinkia Prince",
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                subtitle: Text("Let's get something?",
                    style: TextStyle(fontSize: 17, height: 1.7)),
              ),
    
              //Featured Container
              Container(
                height: 130,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    //Container 1
                    Container(
                      height: 130,
                      width: 280,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 255, 137, 59),
                          borderRadius: BorderRadius.circular(15)),
                      child: Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(14),
                            child: Text(
                              "40% Off During\nCovid 19",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                          ),
                          Positioned(
                              bottom: 0,
                              right: 0,
                              child: Image.asset(
                                'assets/images/image1.png',
                                width: 140,
                              )),
                        ],
                      ),
                    ),
    
                    SizedBox(
                      width: 22,
                    ),
                    //container 2
                    Container(
                      height: 130,
                      width: 280,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(15)),
                      child: Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(14),
                            child: Text(
                              "40% Off During\nCovid 19",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                          ),
                          Positioned(
                              bottom: 0,
                              right: 0,
                              child: Image.asset(
                                'assets/images/image2.png',
                                width: 140,
                              )),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 22,
                    ),
                    //Container 3
                    Container(
                      height: 130,
                      width: 280,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 253, 164, 47),
                          borderRadius: BorderRadius.circular(15)),
                      child: Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(14),
                            child: Text(
                              "40% Off During\nCovid 19",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                          ),
                          Positioned(
                              bottom: 0,
                              right: 0,
                              child: Image.asset(
                                'assets/images/image3.png',
                                width: 140,
                              )),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 22,
                    ),
                    //Container 4
    
                    Container(
                      height: 130,
                      width: 280,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(15)),
                      child: Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(14),
                            child: Text(
                              "40% Off During\nCovid 19",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                          ),
                          Positioned(
                              bottom: 0,
                              right: 0,
                              child: Image.asset(
                                'assets/images/image1.png',
                                width: 140,
                              )),
                        ],
                      ),
                    )
                  ],
                ),
              ),
    
    
              Padding(
                padding: const EdgeInsets.only(top:15,right: 10,bottom: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Top Categories',style: TextStyle(fontSize: 17,fontWeight: FontWeight.w500),),
                    Text('View All',style: TextStyle(fontSize: 17,color: Color.fromARGB(255, 247, 107, 42)),),
                  ],
                ),
              ),
    
              Container(
                margin: EdgeInsets.only(bottom: 15),
                height: 38,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(right: 8),
                      height: 38,
                      width: 105,
                      decoration: BoxDecoration(color: Color.fromARGB(255, 221, 221, 221), borderRadius: BorderRadius.circular(50)),
                      child: Center(child: Text(_categories[index],style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16),)),
                    );
                  },
                  itemCount: _categories.length,
                  
                  ),
              ),
    
              Container(
                height: 500,
                child: GridView.builder(
                  itemCount: productList.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 0.7,
                  crossAxisCount: 2,
                  
                  ), 
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(right: 10,left: 15,top: 55),
                      height: 160,
                      width: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(255, 241, 237, 237),
                            spreadRadius: 5,
                            blurRadius: 10
                          )
                        ]
                      ),

                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Positioned(
                            top: -40,
                            left: 22,
                            child: CircleAvatar(
                              backgroundColor: Color.fromARGB(255, 243, 203, 193),
                              radius: 57,
                              child: Image.asset('assets/images/image7.png',height: 100,)),
                          ),
                          
                          Positioned(
                            top: 90,
                            left: 13,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(productList[index]['ProductN'], style: TextStyle(fontSize: 19,fontWeight: FontWeight.w500,height: 2),),
                                Text(productList[index]['Description'],style: TextStyle(fontSize: 17,color: Colors.grey)),
                                Text(productList[index]['Price'],style: TextStyle(fontSize: 19,fontWeight: FontWeight.w500,height: 1.5,color: Color.fromARGB(255, 102, 7, 255))),
                              ],
                            ),
                          )
                          
                        ],
                      ),
                    );
                  },
                
                ),
              )
    
    
    
    
            ],
          ),
        ),
      ),
    );
  }
}

