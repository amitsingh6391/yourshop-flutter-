import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import "package:yourshop/pages/Homescreen.dart";
import "package:yourshop/pages/chatscreen.dart";
import "package:yourshop/pages/myadsscreen.dart";
import "package:yourshop/pages/profilescreen.dart";
import "package:yourshop/pages/sellscreen.dart";



void main(){
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      title: "yourshop",
      home: Homepage(),
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
  
  Homescreen(),
  Chatscreen(),
  Sellscreen(),
  
   Myadsscreen(),
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
               Text("Home",style: TextStyle(color:Colors.white),)
             ],
           ),
            Column(
              children: <Widget>[
                SizedBox(height:10),
                Icon(Icons.message, size: 35,color:Colors.white),
                 Text("Chat",style: TextStyle(color:Colors.white),)
              ],
            ),
            Column(
              children: <Widget>[
                 SizedBox(height:10),
                Icon(Icons.shop, size: 35,color:Colors.white),
                 Text("Sell",style: TextStyle(color:Colors.white),)
              ],
            ),
            Column(
              children: <Widget>[
                 SizedBox(height:10),
                Icon(Icons.favorite, size: 35,color:Colors.white),
                 Text("My ads",style: TextStyle(color:Colors.white),)
              ],
            ),
            Column(
              children: <Widget>[
                 SizedBox(height:10),
                Icon(Icons.perm_identity, size: 35,color:Colors.white),
                 Text("Profile",style: TextStyle(color:Colors.white),)
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
        // body: Container(
        //   color: Colors.white,
        //   child: Center(
        //     child: Column(
        //       children: <Widget>[
        //         Text(_page.toString(), textScaleFactor: 10.0),
        //         RaisedButton(
        //           child: Text('Go To Page of index 1'),
        //           onPressed: () {
        //             final CurvedNavigationBarState navBarState =
        //                 _bottomNavigationKey.currentState;
        //             navBarState.setPage(1);
        //           },
        //         )
        //       ],
        //     ),
        //   ),
        // )
        body:pages[_page]
    );
  }
}