import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/foundation.dart';

import "package:flutter/material.dart";


import 'package:yourshop/phonefulldetail.dart';

import "package:yourshop/services/crud.dart";

Color x = Colors.white;
Color textcolor = Colors.black;

class Phonedata extends StatefulWidget {
  @override
  _PhonedataState createState() => _PhonedataState();
}

class _PhonedataState extends State<Phonedata> {
  Stream  phoneStream;

  //now we are declare code section here

  TextEditingController commentsEditingController = new TextEditingController();
  QuerySnapshot phoneResultSnapshot;

  // Color x=Colors.white;
  // Color textcolor=Colors.black;

  CrudMethods crudMethods = new CrudMethods();

  @override
  void initState() {
    crudMethods.getPhoneData().then((result) {
      setState(() {
        phoneStream = result;
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
          child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back, color: Colors.white))),
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: Row(
                    children: <Widget>[
                      Text("Find Smartphones in your nearby ",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontStyle: FontStyle.italic)),
                      Icon(Icons.location_on)
                    ],
                  ),
                ),
              ),
              Container(
                child: phoneStream != null
                    ? Container(
                        child: StreamBuilder(
                          stream: phoneStream,
                          builder: (context, snapshot) {
                            return ListView.builder(
                                reverse: true,
                                physics: NeverScrollableScrollPhysics(),
                                padding: EdgeInsets.symmetric(horizontal: 16),
                                itemCount: snapshot.data.documents.length,
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return PhoneTilepage(
                                    contact: snapshot
                                        .data.documents[index].data['contact'],
                                    title: snapshot
                                        .data.documents[index].data["title"],
                                    description: snapshot
                                        .data.documents[index].data['desc'],
                                    image1Url: snapshot.data.documents[index]
                                        .data['phone1imageurl'],
                                    image2Url: snapshot.data.documents[index]
                                        .data['phone2imageurl'],
                                    price: snapshot
                                        .data.documents[index].data["price"],
                                    address: snapshot
                                        .data.documents[index].data["address"],
                                    documentId: snapshot.data.documents[index]
                                        .data["documentID"],
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
    );
  }
}

class PhoneTilepage extends StatefulWidget {
  String title,
      description,
      image1Url,
      image2Url,
      contact,
      price,
      address,
      documentId;

  PhoneTilepage({
    @required this.address,
    @required this.image1Url,
    @required this.title,
    @required this.price,
    @required this.image2Url,
    @required this.description,
    @required this.documentId,
    @required this.contact,
  });

  @override
  _PhoneTilepageState createState() =>
      _PhoneTilepageState();
}

class _PhoneTilepageState extends State<PhoneTilepage> {
  BuildContext context;
  Stream ecstream;
  CrudMethods crudMethods = CrudMethods();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      Phonefulldetail(documentID: widget.documentId)));
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
                              Icon(Icons.location_on), Text(widget.address)
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
                          Text(widget.title,
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ]),
                ),
              )),
        ),
      ),
    ));
  }
}
