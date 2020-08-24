import "package:flutter/material.dart";

import 'package:yourshop/itemcategory/bikes.dart';
import 'package:yourshop/itemcategory/books.dart';
import 'package:yourshop/itemcategory/electronic.dart';
import 'package:yourshop/itemcategory/fashion.dart';
import 'package:yourshop/itemcategory/phones.dart';
import 'package:yourshop/itemcategory/sports.dart';

class Sellscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Container(
                child: Column(
      children: <Widget>[
        Stack(children: [
          Container(
            height: 70,
            width: MediaQuery.of(context).size.width,
            child: Image(
              image: AssetImage("assets/images/h2.jpg"),
              fit: BoxFit.fill,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30, left: 20),
            child: Text("Select you item category...",
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.red,
                    fontFamily: "Dancing",
                    fontWeight: FontWeight.bold)),
          ),
        ]),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Row(
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BikedataUpload()));
                },
                child: Container(
                  color: Colors.black12,
                  height: MediaQuery.of(context).size.height / 6,
                  width: MediaQuery.of(context).size.width / 2,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                        color: Colors.orange,
                        shadowColor: Colors.white,
                        elevation: 20,
                        child: Stack(
                          children: <Widget>[
                            Image(
                                height: 130,
                                width: 100,
                                image: AssetImage("assets/images/bikesell.png"),
                                fit: BoxFit.fill),
                            Text("Bikes",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20))
                          ],
                        )),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Fashiondataupload()));
                },
                child: Container(
                  color: Colors.black12,
                  height: MediaQuery.of(context).size.height / 6,
                  width: MediaQuery.of(context).size.width / 2,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                        color: Colors.orange,
                        shadowColor: Colors.white,
                        elevation: 20,
                        child: Stack(
                          children: <Widget>[
                            Image(
                              image: AssetImage("assets/images/fashion.jpg"),
                            ),
                          ],
                        )),
                  ),
                ),
              ),
            ],
          ),
        ),
        Row(children: [
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Phonedataupload()));
            },
            child: Container(
              color: Colors.black12,
              height: MediaQuery.of(context).size.height / 6,
              width: MediaQuery.of(context).size.width / 2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                    color: Colors.white,
                    shadowColor: Colors.white,
                    elevation: 20,
                    child: Stack(
                      children: <Widget>[
                        Image(
                            image: AssetImage("assets/images/phone logo.jpg")),
                        Text("Phones",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.black)),
                      ],
                    )),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Electronicdataupload()));
            },
            child: Container(
              color: Colors.black12,
              height: MediaQuery.of(context).size.height / 6,
              width: MediaQuery.of(context).size.width / 2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                    color: Colors.white,
                    shadowColor: Colors.white,
                    elevation: 20,
                    child: Stack(
                      children: <Widget>[
                        Image(
                            image: AssetImage(
                                "assets/images/electronic logo.jpg")),
                        Text("Electronic",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.black))
                      ],
                    )),
              ),
            ),
          )
        ]),
        Row(children: [
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Sportsdataupload()));
            },
            child: Container(
              color: Colors.black12,
              height: MediaQuery.of(context).size.height / 6,
              width: MediaQuery.of(context).size.width / 2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                    color: Colors.green,
                    shadowColor: Colors.white,
                    elevation: 20,
                    child: Stack(
                      children: <Widget>[
                        Image(
                          image: AssetImage("assets/images/sport logo.jpg"),
                        ),
                      ],
                    )),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Booksdataupload()));
            },
            child: Container(
              color: Colors.black12,
              height: MediaQuery.of(context).size.height / 6,
              width: MediaQuery.of(context).size.width / 2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                    color: Colors.green,
                    shadowColor: Colors.white,
                    elevation: 20,
                    child: Stack(
                      children: <Widget>[
                        Image(
                            image: AssetImage("assets/images/books logo.png")),
                      ],
                    )),
              ),
            ),
          )
        ]),
         Text("Made in India",
        style: 
        TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color:Colors.black,fontFamily: "Dancing")),
        Container(
          height: 200,
          child: Image(
              fit: BoxFit.fill, image: AssetImage("assets/images/ashok.jpg")),
        ),
         
      ],
    ))));
  }
}
