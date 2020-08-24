import 'dart:async';

import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import "package:yourshop/pages/Homescreen.dart";
import "package:yourshop/pages/chatscreen.dart";
import "package:yourshop/pages/myadsscreen.dart";
import "package:yourshop/pages/profilescreen.dart";
import "package:yourshop/pages/sellscreen.dart";
import 'package:yourshop/view/viewmain.dart';



void main(){
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      title: "yourshop",
      home: Splashscreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _page = 0;
  GlobalKey _bottomNavigationKey = GlobalKey();
  var pages = [
  
 MyApp(),
 // Homescreen(),
  //Chatscreen(),
  Sellscreen(),
  
   //Myadsscreen(),
   Profilescreen(),
 
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          index: 0,
          height: 50.0,
          items: <Widget>[
            
           Column(
             children: <Widget>[
                 SizedBox(height:10),
               Icon(Icons.home, size: 35,color: Colors.white,),
               Text("Home",style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold),)
             ],
           ),
           
            Column(
              children: <Widget>[
                 SizedBox(height:10),
                Icon(Icons.shop, size: 35,color:Colors.white),
                 Text("Sell",style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold),)
              ],
            ),
           
            Column(
              children: <Widget>[
                 SizedBox(height:10),
                Icon(Icons.perm_identity, size: 35,color:Colors.white),
                 Text("Profile",style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold),)
              ],
            ),
          ],
          color: Colors.black,
          buttonBackgroundColor: Colors.black,
          backgroundColor: Colors.white,
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 600),
          onTap: (index) {
            setState(() {
              _page = index;
            });
          },
        ),
       
        body:pages[_page]
    );
  }
}

class Splashscreen extends StatefulWidget {

  
  @override
  _SplashscreenState createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {

  @override
  void initState() {
    // TODO: implement initState

    Timer(
      Duration(seconds:5),
      () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>Homepage(),
            ));
      },
    );
    super.initState();
  }
  @override

  Widget build(BuildContext context) {

    return Scaffold(

     backgroundColor:Colors.green,
      body: SafeArea(
              child: Container(
                height: MediaQuery.of(context).size.height,
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height:MediaQuery.of(context).size.height/4),
                   

                    SizedBox(height:20),
                   
                    Center(
                      child: Container(

                        height: 200,
                        width:200,
                       
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(120),
                         image:DecorationImage(

                           image: AssetImage(
                             "assets/images/yleafe.jpg"
                           ),fit:BoxFit.fill

                         ),
                          color: Colors.red,
                        
                       ),

                       child:Text("")
                       
                      ),

                    ),SizedBox(height:10),

                     Text(
                      "Buy & Sell Product Now",
                      style: TextStyle(fontSize:30,fontFamily: "Dancing",
                    fontWeight:FontWeight.bold,color:Colors.orange
                    ),),
                    SizedBox(height:10),

                   CircularProgressIndicator(
                     backgroundColor:Colors.red
                   ),
                    
                    SizedBox(
                      height:200
                    ),
                    Text(
                      "Offerd By: CodeApps Inc.",
                      style: TextStyle(fontSize:20,fontFamily: "Dancing",
                    fontWeight:FontWeight.bold,
                    ),)
                  ],
                ),
              ),
      ),
      
    );
  }
}

