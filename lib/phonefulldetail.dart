import "package:flutter/material.dart";
import "package:cloud_firestore/cloud_firestore.dart";
import 'package:url_launcher/url_launcher.dart';

class Phonefulldetail extends StatefulWidget {
  String documentID;
  Phonefulldetail({Key key, this.documentID}) : super(key: key);
  @override
  _Phonedetailnewtate createState() => _Phonedetailnewtate();
}

class _Phonedetailnewtate extends State<Phonefulldetail> {
  @override
  Widget build(BuildContext context) {
    return 
    
    Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        child:GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back,color:Colors.white))
      ),
          body: SafeArea(
        child: Container(
          color: Colors.white,
          child: StreamBuilder(
            stream: Firestore.instance
                .collection("phone")
                .document(widget.documentID)
                .snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Text("Loading");
              }
              var Phonedetailnew = snapshot.data;
              return SingleChildScrollView(
                  child: Column(children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                        Card(
                          elevation: 10,
                                                  child: Container(
                      
                      height:  MediaQuery.of(context).size.height/2,
                      width: MediaQuery.of(context).size.width,
                      child: Card(
                        
                            color: Colors.white,
                            elevation: 20,
                            child: Stack(
                              fit: StackFit.expand,
                              children: <Widget>[
                                
                                Image(
                                  image: NetworkImage(Phonedetailnew["phone1imageurl"]),
                                  fit: BoxFit.fill,
                                ),
                                Container(
                                  alignment: Alignment.bottomCenter,
                                  child: Text("⭕⭕",style: TextStyle(fontSize:30),)
                                )
                              ],
                            )),
                    ),
                        ),
                    Container(
                     
                      height: MediaQuery.of(context).size.height / 2,
                      width: MediaQuery.of(context).size.width,
                      child: Card(
                          color: Colors.white,
                          elevation: 20,
                          child: Stack(fit: StackFit.expand, children: [
                            Image(
                              image: NetworkImage(Phonedetailnew["phone2imageurl"]),
                              fit: BoxFit.fill,
                            ),
                            Container(
                              alignment: Alignment.bottomCenter,
                              child: Text("⭕⭕",style:TextStyle(fontSize:30))
                            )
                          ])),
                    )

                  ]),
                ),
                 Card(
                   elevation: 20,
                                    child: Container(
                      
                      child: Column(
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text(
                                "₹. ",
                                style: TextStyle(fontSize: 20),
                              ),
                             
                              Text(Phonedetailnew["price"],
                              style: TextStyle(fontSize: 30),),
                            ],
                          ),
                           SizedBox(
                              height:10
                            ),
                          Container(
                            alignment: Alignment.bottomLeft,
                            child: Text(Phonedetailnew["title"],style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)),
                         SizedBox(height:10),
                          GestureDetector(
                            onTap: () {
                                var x =Phonedetailnew["contact"];

                                launch("tel:// $x");
                              },
                                                      child: Row(
                              children: <Widget>[
                                //Text("Contact no:  ☎️  ",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
                               
                                Text(Phonedetailnew["contact"],
                                style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.green,
                                              fontWeight: FontWeight.bold)),

                                 Container(
                                    height: 40,
                                    child: Image(
                                        fit: BoxFit.fill,
                                        image: AssetImage(
                                            "assets/images/call logo.jpg")),
                                  ),
                              ],
                            ),
                          ),
                           SizedBox(height:10),
                         Row(
                           children: <Widget>[
                             Text("Address: 🏠🏚️-"),
                            
                           ],
                         ),
                         Container(
                           alignment: Alignment.bottomLeft,
                           child: Text(Phonedetailnew["address"],style:TextStyle(fontSize:20)))
                            ],
                          )
                        ],
                      ),
                    ),
                 ),
                  SizedBox(height:10),
                Container(
                      child: Column(
                        children: <Widget>[
                          Text("Descrpition: ",style: TextStyle(fontSize:20,fontWeight: FontWeight.bold)),
                          Text(Phonedetailnew["desc"],style: TextStyle(fontSize:15),)
                        ],
                      ),
                    ),
                    Text("🛒🛒",style: TextStyle(fontSize:50,fontWeight: FontWeight.bold))
              ]));
            },
          ),
        ),
      ),
    );
  }
}




//for only selction one category...


class Phonedetailnew extends StatefulWidget {
  String documentID;
  Phonedetailnew({Key key, this.documentID}) : super(key: key);
  @override
  _PhonedetailnewState createState() => _PhonedetailnewState();
}

class _PhonedetailnewState extends State<Phonedetailnew> {
  @override
  Widget build(BuildContext context) {
    return 
    
    Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        child:GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back,color:Colors.white))
      ),
          body: SafeArea(
        child: Container(
          color: Colors.white,
          child: StreamBuilder(
            stream: Firestore.instance
                .collection("phone")
                .document(widget.documentID)
                .snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Text("Loading");
              }
              var Phonedetailnew = snapshot.data;
              return SingleChildScrollView(
                  child: Column(children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                        Card(
                          elevation: 10,
                                                  child: Container(
                      
                      height:  MediaQuery.of(context).size.height/2,
                      width: MediaQuery.of(context).size.width,
                      child: Card(
                        
                            color: Colors.white,
                            elevation: 20,
                            child: Stack(
                              fit: StackFit.expand,
                              children: <Widget>[
                                
                                Image(
                                  image: NetworkImage(Phonedetailnew["electronic1imageurl"]),
                                  fit: BoxFit.fill,
                                ),
                                Container(
                                  alignment: Alignment.bottomCenter,
                                  child: Text("⭕⭕",style: TextStyle(fontSize:30),)
                                )
                              ],
                            )),
                    ),
                        ),
                    Container(
                     
                      height: MediaQuery.of(context).size.height / 2,
                      width: MediaQuery.of(context).size.width,
                      child: Card(
                          color: Colors.white,
                          elevation: 20,
                          child: Stack(fit: StackFit.expand, children: [
                            Image(
                              image: NetworkImage(Phonedetailnew["electronic2imageurl"]),
                              fit: BoxFit.fill,
                            ),
                            Container(
                              alignment: Alignment.bottomCenter,
                              child: Text("⭕⭕",style:TextStyle(fontSize:30))
                            )
                          ])),
                    )

                  ]),
                ),
                 Card(
                   elevation: 20,
                                    child: Container(
                      
                      child: Column(
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text(
                                "₹. 💵💵 ",
                                style: TextStyle(fontSize: 20),
                              ),
                             
                              Text(Phonedetailnew["price"],
                              style: TextStyle(fontSize: 30),),
                            ],
                          ),
                           SizedBox(
                              height:10
                            ),
                          Container(
                            alignment: Alignment.bottomLeft,
                            child: Text(Phonedetailnew["title"],style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)),
                         SizedBox(height:10),
                          Row(
                            children: <Widget>[
                              Text("Contact no:  ☎️  ",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
                             
                              Text(Phonedetailnew["contact"]),
                            ],
                          ),
                           SizedBox(height:10),
                         Row(
                           children: <Widget>[
                             Text("Address: 🏠🏚️-"),
                            
                           ],
                         ),
                         Container(
                           alignment: Alignment.bottomLeft,
                           child: Text(Phonedetailnew["address"],style:TextStyle(fontSize:15)))
                            ],
                          )
                        ],
                      ),
                    ),
                 ),
                  SizedBox(height:10),
                Container(
                      child: Column(
                        children: <Widget>[
                          Text("Descrpition: ",style: TextStyle(fontSize:20,fontWeight: FontWeight.bold)),
                          Text(Phonedetailnew["desc"],style: TextStyle(fontSize:15),)
                        ],
                      ),
                    ),
                    Text("🛒🛒",style: TextStyle(fontSize:50,fontWeight: FontWeight.bold))
              ]));
            },
          ),
        ),
      ),
    );
  }
}