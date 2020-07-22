import 'package:cloud_firestore/cloud_firestore.dart';
import "package:flutter/material.dart";
import 'package:yourshop/Tilefolder/electronictile.dart';
import 'package:yourshop/Tilefolder/phonetile.dart';
import "package:yourshop/categorywiseproduct/bikeandcycle.dart";
import 'package:yourshop/categorywiseproduct/electronicdata.dart';
import 'package:yourshop/categorywiseproduct/phonecategory.dart';
import 'package:yourshop/itemcategory/fashion.dart';
import "package:yourshop/services/crud.dart";
import "package:yourshop/bikefulldetail.dart";

class Homescreen extends StatefulWidget {
  @override
  _HomescreenState createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  CrudMethods crudMethods = new CrudMethods();
  Stream bikeStream;
  Stream electronicStream;
  Stream phoneStream;

  @override
  void initState() {
    crudMethods.getData().then((result) {
      setState(() {
        bikeStream = result;
      });
    });

    crudMethods.getelectronicData().then((result){
      setState(() {
        electronicStream = result;
      });
    });

    crudMethods.getPhoneData().then((result){
      setState(() {
        phoneStream = result;
      });
    });


    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
          child: Column(
        children: <Widget>[
          SizedBox(height: 10),
          Row(
            children: <Widget>[
              Text("Find Categories wise",
                  style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic)),
            ],
          ),
          SizedBox(height: 5),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Container(
                child: Row(children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Bikeandcycle()));
                },
                child: Container(
                  height: MediaQuery.of(context).size.height / 6,
                  width: MediaQuery.of(context).size.width / 2,
                  color: Colors.black,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Card(
                      shadowColor: Colors.white,
                      elevation: 10,
                      margin: EdgeInsets.all(5),
                      color: Colors.white,
                      child: Column(
                        children: <Widget>[
                          // Image(
                          //     image: NetworkImage(
                          //         "http://stat.overdrive.in/wp-content/uploads/2020/04/BMW-R-18-1.jpg")),
                          CircleAvatar(
                              radius: 45,
                              backgroundImage: NetworkImage(
                                  "http://stat.overdrive.in/wp-content/uploads/2020/04/BMW-R-18-1.jpg")),

                          Text(
                            "Bikes",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder:(context)=>Phonedata()) );
                },
                              child: Container(
                  height: MediaQuery.of(context).size.height / 6,
                  width: MediaQuery.of(context).size.width / 2,
                  color: Colors.black,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Card(
                      shadowColor: Colors.black,
                      elevation: 10,
                      margin: EdgeInsets.all(5),
                      color: Colors.white,
                      child: Column(
                        children: <Widget>[
                          CircleAvatar(
                              radius: 45,
                              backgroundImage: NetworkImage(
                                  "https://www.halfpricecellphones.ca/wp-content/uploads/2019/08/Refurbished-Mobile-Phones.png")),
                          Text("Phone",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Electronicdata()));
                },
                child: Container(
                  height: MediaQuery.of(context).size.height / 6,
                  width: MediaQuery.of(context).size.width / 2,
                  color: Colors.black,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Card(
                        shadowColor: Colors.black,
                        elevation: 10,
                        margin: EdgeInsets.all(5),
                        color: Colors.white,
                        child: Column(
                          children: <Widget>[
                            CircleAvatar(
                                radius: 45,
                                backgroundImage: NetworkImage(
                                    "https://images.livemint.com/img/2019/06/18/600x338/TA_-_2019-05-30T122540.164_1559199609849_1560866779004.png")),
                            Text("Electronics",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold)),
                          ],
                        )),
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height / 6,
                width: MediaQuery.of(context).size.width / 2,
                color: Colors.black,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Card(
                      shadowColor: Colors.black,
                      elevation: 10,
                      margin: EdgeInsets.all(5),
                      color: Colors.white,
                      child: Column(
                        children: <Widget>[
                          CircleAvatar(
                              radius: 45,
                              backgroundImage: NetworkImage(
                                  "https://s3.ap-southeast-1.amazonaws.com/images.deccanchronicle.com/dc-Cover-ilbrrabfksagbfb0ompgpgran2-20181119132727.Medi.jpeg")),
                          Text("Fashion",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold)),
                        ],
                      )),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height / 6,
                width: MediaQuery.of(context).size.width / 2,
                color: Colors.black,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Card(
                      shadowColor: Colors.black,
                      elevation: 10,
                      margin: EdgeInsets.all(5),
                      color: Colors.white,
                      child: Column(
                        children: <Widget>[
                          CircleAvatar(
                              radius: 45,
                              backgroundImage: NetworkImage(
                                  "https://image.shutterstock.com/image-photo/high-angle-view-various-sport-260nw-1026630514.jpg")),
                          Text("Sports",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold)),
                        ],
                      )),
                ),
              ),
            ])),
          ),
          SizedBox(height: 20),
          Row(
            children: <Widget>[
              Text("Fresh recommendations:",
                  style: TextStyle(
                    fontSize: 20,
                  )),
            ],
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
                                return Phonetile(
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
                                  documentId: snapshot
                                      .data.documents[index].data["documentID"],
                                );
                              });
                        }))
                : Container(
                    alignment: Alignment.center,
                    child: CircularProgressIndicator(),
                  ),
          ),
          Container(
            child: electronicStream != null
                ? Container(
                    child: StreamBuilder(
                        stream: electronicStream,
                        builder: (context, snapshot) {
                          return ListView.builder(
                              reverse: true,
                              physics: NeverScrollableScrollPhysics(),
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              itemCount: snapshot.data.documents.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return ElectronicTile(
                                  contact: snapshot
                                      .data.documents[index].data['contact'],
                                  title: snapshot
                                      .data.documents[index].data["title"],
                                  description: snapshot
                                      .data.documents[index].data['desc'],
                                  image1Url: snapshot.data.documents[index]
                                      .data['electronic1imageurl'],
                                  image2Url: snapshot.data.documents[index]
                                      .data['electronic2imageurl'],
                                  price: snapshot
                                      .data.documents[index].data["price"],
                                  address: snapshot
                                      .data.documents[index].data["address"],
                                  documentId: snapshot
                                      .data.documents[index].data["documentID"],
                                );
                              });
                        }))
                : Container(
                    alignment: Alignment.center,
                    child: CircularProgressIndicator(),
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
                                  title: snapshot
                                      .data.documents[index].data["title"],
                                  description: snapshot
                                      .data.documents[index].data['desc'],
                                  image1Url: snapshot.data.documents[index]
                                      .data['bike1imageurl'],
                                  image2Url: snapshot.data.documents[index]
                                      .data['bike2imageurl'],
                                  price: snapshot
                                      .data.documents[index].data["price"],
                                  address: snapshot
                                      .data.documents[index].data["address"],
                                  documentId: snapshot
                                      .data.documents[index].data["documentID"],
                                );
                              });
                        }))
                : Container(
                    alignment: Alignment.center,
                    child: CircularProgressIndicator(),
                  ),
          ),
          Text("new version....")
        ],
      )),
    ));
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

  BlogsTile({
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
  _BlogsTileState createState() => _BlogsTileState();
}

class _BlogsTileState extends State<BlogsTile> {
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
