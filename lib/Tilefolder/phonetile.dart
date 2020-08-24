import "package:flutter/material.dart";
import 'package:yourshop/phonefulldetail.dart';



class Phonetile extends StatefulWidget {
  String title,
      description,
      image1Url,
      image2Url,
      contact,
      price,
      address,
      documentId;

  Phonetile({
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
  _PhonetileState createState() => _PhonetileState();
}

class _PhonetileState extends State<Phonetile> {
  // BuildContext context;
  // Stream phonestream;
  // CrudMethods crudMethods = CrudMethods();
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
