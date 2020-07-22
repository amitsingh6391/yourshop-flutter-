import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'package:flutter/foundation.dart';

import "package:flutter/material.dart";
import "package:yourshop/bikefulldetail.dart";
import "package:cached_network_image/cached_network_image.dart";
import 'package:yourshop/itemcategory/bikes.dart';
import 'package:url_launcher/url_launcher.dart';
import "package:link_text/link_text.dart";
import "package:yourshop/services/crud.dart";

Color x = Colors.white;
Color textcolor = Colors.black;

class Bikeandcycle extends StatefulWidget {
  @override
  _BikeandcycleState createState() => _BikeandcycleState();
}

class _BikeandcycleState extends State<Bikeandcycle> {
  Stream bikeStream;

  //now we are declare code section here

  TextEditingController commentsEditingController = new TextEditingController();
  QuerySnapshot searchResultSnapshot;

  // Color x=Colors.white;
  // Color textcolor=Colors.black;

  CrudMethods crudMethods = new CrudMethods();

  @override
  void initState() {
    crudMethods.getData().then((result) {
      setState(() {
        bikeStream = result;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //define a button to select the ne w post
      backgroundColor: x,
        floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        child:GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back,color:Colors.white))
      ),
      body: SafeArea(
              child: SingleChildScrollView(
          physics: ScrollPhysics(),
          child: SafeArea(
                    child: Column(
              children: <Widget>[
                SizedBox(height:10),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: <Widget>[
                      Text("Find Bikes & Cycle nearby",
                    style:TextStyle(fontSize:20,color: Colors.black,
                    fontStyle:FontStyle.italic)),
                    Icon(Icons.location_on)
                    ],
                  ),
                ),
               
                Container(
                  child: bikeStream != null
                      ? Container(
                          child: StreamBuilder(
                            stream: bikeStream,
                            builder: (context, snapshot) {
                              return ListView.builder(
                                  reverse: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  padding: EdgeInsets.symmetric(horizontal: 16),
                                  itemCount: snapshot.data.documents.length,
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    return BlogsTile(
                                      contact: snapshot
                                          .data.documents[index].data['contact'],
                                      title:
                                          snapshot.data.documents[index].data["title"],
                                      description:
                                          snapshot.data.documents[index].data['desc'],
                                      image1Url: snapshot
                                          .data.documents[index].data['bike1imageurl'],
                                      image2Url: snapshot
                                          .data.documents[index].data['bike2imageurl'],
                                      price:
                                          snapshot.data.documents[index].data["price"],
                                      address: snapshot
                                          .data.documents[index].data["address"],
                                      documentId: snapshot
                                          .data.documents[index].data["documentID"],
                                    );
                                  });
                            },
                          ),
                        )
                      : Container(
                          alignment: Alignment.center,
                          child: CircularProgressIndicator(),
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}




class BlogsTile extends StatefulWidget {
  String title,
      description,
      image1Url,
      image2Url,
      contact,
      price,
      address,
      documentId;

  BlogsTile(
      {@required this.address,
      @required this.image1Url,
      @required this.title,
      @required this.price,
      @required this.image2Url,
      @required this.description,
      @required this.documentId,
      @required this.contact});

  @override
  _BlogsTileState createState() => _BlogsTileState();
}

class _BlogsTileState extends State<BlogsTile> {
  BuildContext context;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
     return 
     
    SafeArea(
        child: SingleChildScrollView(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      Bikedetails(documentID: widget.documentId)));
        },
        child: Card(
         // color:Colors.black,
         elevation: 10,
         shadowColor: Colors.black,
                  child: Container(
              //height: 170,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(children: [
                    Container(
                      // width:MediaQuery.of(context).size.width/2 ,
                      child: Column(
                        children: <Widget>[
                          Card(
                            elevation: 10,
                            child: Stack(children: [
                              Image(
                                height: 190,
                                width: 170,
                                // color: Colors.blue,
                                image: NetworkImage(widget.image1Url),
                                fit: BoxFit.fill,
                              ),
                            ]),
                          ),
                           Row(
                          children: <Widget>[
                            // Icon(Icons.phone),
                            // Text(widget.contact),
                            Icon(Icons.location_on)
                            ,Text(widget.address)
                          ],
                        ),
                        ],
                      ),
                    ),
                    // SizedBox(width: 10),
                    Container(
                      // width:MediaQuery.of(context).size.width/2 ,
                      child: Column(
                        children: <Widget>[
                          Card(
                            elevation: 10,
                            child: Stack(children: [
                              Image(
                                height: 150,
                                width: 130,
                                // color: Colors.blue,
                                image: NetworkImage(widget.image2Url),
                                fit: BoxFit.fill,
                              ),
                            ]),
                          ),
                           Row(
                          children: <Widget>[
                            Text(
                              "₹.",
                              style: TextStyle(fontSize: 20),
                            ),
                            Text(widget.price),
                          ],
                        ),
                        Text(widget.title,style:TextStyle(fontWeight:FontWeight.bold) ),
                       
                        
                        ],
                      ),
                    ),
                    // Column(
                    //   children: <Widget>[
                    //     Row(
                    //       children: <Widget>[
                    //         Text(
                    //           "₹.💵",
                    //           style: TextStyle(fontSize: 20),
                    //         ),
                    //         Text(widget.price),
                    //       ],
                    //     ),
                    //     Text(widget.title),
                    //     Text("Contact: "),
                    //     Row(
                    //       children: <Widget>[
                    //         Text("🤳🏻"),
                    //         Text(widget.contact),
                    //       ],
                    //     ),
                    //     Row(
                    //       children: <Widget>[
                    //         Text(
                    //           "🛒🛒",
                    //           style: TextStyle(fontSize: 20),
                    //         ),
                    //       ],
                    //     ),
                    //   ],
                    // ),
                   
                  ]),
                ),
              )),
        ),
      ),
    ));
  }
}
