import 'package:flutter/material.dart';
import 'home.dart';
class my_ad extends StatelessWidget {
  const my_ad({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 70,
          title: Text("My Ads",style: TextStyle(color: Colors.black),),
          elevation: 0,
          backgroundColor: Colors.white,
          centerTitle: true,
          bottom: TabBar(
            
            labelColor: Colors.black,
            tabs: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  children: [
                    Icon(
                      Icons.shopping_bag_outlined
                    ),
                    Text("My Ads"),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  children: [
                    Icon(
                      Icons.favorite_outline
                    ),
                    Text("My favorites")
                  ],
                ),
              ),
            ]
          ),
        ),

        backgroundColor: Color.fromARGB(255, 235, 233, 233),

        body: TabBarView(
          children: [
            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.only(top: 40,left: 15,right: 15),
                itemCount: 6,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 0.7), 
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 10,vertical: 30),
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
                            backgroundImage:AssetImage('assets/images/image5.png'),
                            backgroundColor: Color.fromARGB(255, 243, 203, 193),
                            radius: 57,
                          ),
                        ),
            
                        Positioned(
                          top:90,
                          left: 13,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(home.productList[index]['ProductN'], style: TextStyle(fontSize: 19,fontWeight: FontWeight.w500,height: 2),),
                                  Text(home.productList[index]['Description'],style: TextStyle(fontSize: 17,color: Colors.grey)),
                                  Text(home.productList[index]['Price'],style: TextStyle(fontSize: 19,fontWeight: FontWeight.w500,height: 1.5,color: Color.fromARGB(255, 102, 7, 255))),
                            ],
                          ),
                        )
            
                      ],
                    ),
                  );
                },
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.only(left: 15,right: 15,top: 20),
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.only(bottom: 13),
                    elevation: 0,
                    child: ListTile(
                      contentPadding: EdgeInsets.symmetric(vertical: 8,horizontal:12),
                      leading: CircleAvatar(
                        radius: 27,
                        backgroundColor: Color.fromARGB(255, 243, 203, 193),
                        backgroundImage: AssetImage('assets/images/image5.png'),
                      ),

                      trailing: Text(home.productList[index]['Price'],style: TextStyle(fontSize: 19,fontWeight: FontWeight.w500,height: 1.5,color: Color.fromARGB(255, 102, 7, 255))),

                      title: Text(home.productList[index]['ProductN'], style: TextStyle(fontSize: 19,fontWeight: FontWeight.w500,height: 2),),

                      subtitle: Text(home.productList[index]['Description'],style: TextStyle(fontSize: 17,color: Colors.grey)),
                    ),
                  );
                },
              )
            )
          ]
        ),
      ),
    );
  }
}
