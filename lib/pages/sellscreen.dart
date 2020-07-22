import "package:flutter/material.dart";

import 'package:yourshop/itemcategory/bikes.dart';
import 'package:yourshop/itemcategory/electronic.dart';
import 'package:yourshop/itemcategory/phones.dart';

class Sellscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Container(
                child: Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
              elevation: 20,
              color: Colors.black,
              child: Text(
                "Select your Item category 🛒🛒-",
                style: TextStyle(fontSize: 30, color: Colors.white),
              )),
        ),
        SizedBox(height: 40),
        Row(
          children: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Bikedata()));
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
                      child: Column(
                        children: <Widget>[
                          Icon(Icons.directions_bike, size: 80),
                          Text("Bikes")
                        ],
                      )),
                ),
              ),
            ),
            Container(
              color: Colors.black12,
              height: MediaQuery.of(context).size.height / 6,
              width: MediaQuery.of(context).size.width / 2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                    color: Colors.white,
                    shadowColor: Colors.white,
                    elevation: 20,
                    child: Column(
                      children: <Widget>[
                        Icon(Icons.shopping_basket, size: 80),
                        Text("Fashion")
                      ],
                    )),
              ),
            ),
          ],
        ),
        Row(children: [
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) =>Phonedataupload()));
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
                    child: Column(
                      children: <Widget>[
                        Image(
                            image: NetworkImage(
                                "https://www.halfpricecellphones.ca/wp-content/uploads/2019/08/Refurbished-Mobile-Phones.png")),
                        Text("Phones")
                      ],
                    )),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Electronicdata()));
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
                    child: Column(
                      children: <Widget>[
                        Image(
                            image: NetworkImage(
                                "https://images.livemint.com/img/2019/06/18/600x338/TA_-_2019-05-30T122540.164_1559199609849_1560866779004.png")),
                        Text("Electronic")
                      ],
                    )),
              ),
            ),
          )
        ]),
        Row(children: [
          Container(
            color: Colors.black12,
            height: MediaQuery.of(context).size.height / 6,
            width: MediaQuery.of(context).size.width / 2,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                  color: Colors.white,
                  shadowColor: Colors.white,
                  elevation: 20,
                  child: Column(
                    children: <Widget>[
                      Image(
                          image: NetworkImage(
                              "https://image.shutterstock.com/image-photo/high-angle-view-various-sport-260nw-1026630514.jpg")),
                      Text("Sports")
                    ],
                  )),
            ),
          ),
          Container(
            color: Colors.black12,
            height: MediaQuery.of(context).size.height / 6,
            width: MediaQuery.of(context).size.width / 2,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                  color: Colors.white,
                  shadowColor: Colors.white,
                  elevation: 20,
                  child: Column(
                    children: <Widget>[
                      Image(
                          image: NetworkImage(
                              "https://d3525k1ryd2155.cloudfront.net/i/en20/homepage-slides/modern-first-editions-james-bond-1170.jpg")),
                      Text("Books")
                    ],
                  )),
            ),
          )
        ])
      ],
    ))));
  }
}
