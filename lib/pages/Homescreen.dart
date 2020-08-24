import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
import 'package:intl/intl.dart';
import 'package:yourshop/Tilefolder/bookstile.dart';
import 'package:yourshop/Tilefolder/electronictile.dart';
import 'package:yourshop/Tilefolder/fashiontile.dart';
import 'package:yourshop/Tilefolder/phonetile.dart';
import 'package:yourshop/Tilefolder/sporttile.dart';
import "package:yourshop/categorywiseproduct/bikeandcycle.dart";
import 'package:yourshop/categorywiseproduct/booksdata.dart';
import 'package:yourshop/categorywiseproduct/electronicdata.dart';
import 'package:yourshop/categorywiseproduct/fashiondata.dart';
import 'package:yourshop/categorywiseproduct/phonecategory.dart';
import 'package:yourshop/categorywiseproduct/sportsdata.dart';
import 'package:yourshop/itemcategory/fashion.dart';
import 'package:yourshop/services/admob_service.dart';
import "package:yourshop/services/crud.dart";
import "package:yourshop/bikefulldetail.dart";
import 'package:firebase_admob/firebase_admob.dart';
import 'package:admob_flutter/admob_flutter.dart';

class Homescreen extends StatefulWidget {
  @override
  _HomescreenState createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  CrudMethods crudMethods = new CrudMethods();
  Stream bikeStream;
  Stream electronicStream;
  Stream phoneStream;
  Stream fashionStream;
  Stream bookStream;
  Stream sportStream;
  String userid;

  final ams = AdMobService();
  @override
  void initState() {
   

    getCurrentUser();
    crudMethods.getData().then((result) {
      setState(() {
        bikeStream = result;
      });
    });

    crudMethods.getelectronicData().then((result) {
      setState(() {
        electronicStream = result;
      });
    });

    crudMethods.getPhoneData().then((result) {
      setState(() {
        phoneStream = result;
      });
    });

    crudMethods.getFashionData().then((result) {
      setState(() {
        fashionStream = result;
      });
    });

    crudMethods.getBookData().then((result) {
      setState(() {
        bookStream = result;
      });
    });

    crudMethods.getSportData().then((result) {
      setState(() {
        sportStream = result;
      });
    });

    super.initState();

     Admob.initialize(ams.getAdMobAppId());
  
  }

  getCurrentUser() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final FirebaseUser user = await _auth.currentUser();
    final uid = user.uid;
    print(uid);
    setState(() {
      userid = uid.toString();
    });
  }

  @override
  Widget build(BuildContext context) {

    InterstitialAd newTripAd =
        ams.getnewTripInterstitial(); //first save in the variablesto use adds

    newTripAd.load();
   
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
              child: Column(
            children: <Widget>[
              //SizedBox(height: 10),
              Container(
              //  color: Colors.orange,
                child: Row(
                  children: <Widget>[
                    Stack(children: [
                      Container(
                        height: 70,
                        width: MediaQuery.of(context).size.width,
                        child: Image(
                          image: AssetImage("assets/images/yourhome.jpg"),
                          fit: BoxFit.fill,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 30, left: 20),
                        child: Text("Your",
                            style: TextStyle(
                                fontSize: 40,
                                color: Colors.black,
                                fontFamily: "Dancing",
                                fontWeight: FontWeight.bold)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 30, left: 260),
                        child: Text("Shop",
                            style: TextStyle(
                                fontSize: 40,
                                color: Colors.red,
                                fontFamily: "Dancing",
                                fontWeight: FontWeight.bold)),
                      )
                    ]),
                  ],
                ),
              ),

 
              

              Container(
                //color: Colors.orange,
                width: MediaQuery.of(context).size.width,
                height: 20,
                child: Center(
                  child: Text("Find Categories wise",
                      style: TextStyle(
                          fontSize: 20,
                         // backgroundColor: Colors.orange,
                          fontFamily: "Dancing",
                          fontWeight: FontWeight.bold)),
                ),
              ),

              SizedBox(height: 5),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(
                    child: Row(children: [
                  GestureDetector(
                    onTap: () {

                      newTripAd.show(
                            //show the full screen adds when second year pressed
                            anchorType: AnchorType.bottom,
                            anchorOffset: 0.0,
                            horizontalCenterOffset: 0.0,
                          );

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Bikeandcycle()));
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
                                  backgroundImage:
                                      AssetImage("assets/images/bikesell.png")),

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

                   

                    onTap: () {
                      newTripAd.show(
                            //show the full screen adds when second year pressed
                            anchorType: AnchorType.bottom,
                            anchorOffset: 0.0,
                            horizontalCenterOffset: 0.0,
                          );

                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Phonedata()));
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
                                  backgroundImage: AssetImage(
                                      "assets/images/phone logo.jpg")),
                              Text("Phone",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {

                      newTripAd.show(
                            //show the full screen adds when second year pressed
                            anchorType: AnchorType.bottom,
                            anchorOffset: 0.0,
                            horizontalCenterOffset: 0.0,
                          );

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
                                    backgroundImage: AssetImage(
                                        "assets/images/electronic logo.jpg")),
                                Text("Electronics",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold)),
                              ],
                            )),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      newTripAd.show(
                            //show the full screen adds when second year pressed
                            anchorType: AnchorType.bottom,
                            anchorOffset: 0.0,
                            horizontalCenterOffset: 0.0,
                          );

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Fashiondata()));
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
                                    backgroundImage: AssetImage(
                                        "assets/images/fashion.jpg")),
                                Text("Fashion",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold)),
                              ],
                            )),
                      ),
                    ),
                  ),

                  //bokkcategory..

                  GestureDetector(
                    onTap: () {
                      newTripAd.show(
                            //show the full screen adds when second year pressed
                            anchorType: AnchorType.bottom,
                            anchorOffset: 0.0,
                            horizontalCenterOffset: 0.0,
                          );

                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Bookdata()));
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
                                    backgroundImage: AssetImage(
                                        "assets/images/books logo.png")),
                                Text("Books",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold)),
                              ],
                            )),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {

                      newTripAd.show(
                            //show the full screen adds when second year pressed
                            anchorType: AnchorType.bottom,
                            anchorOffset: 0.0,
                            horizontalCenterOffset: 0.0,
                          );

                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Sportdata()));
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
                                    backgroundImage: AssetImage(
                                        "assets/images/sport logo.jpg")),
                                Text("Sports",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold)),
                              ],
                            )),
                      ),
                    ),
                  ),
                ])),
              ),
              SizedBox(height: 20),
              Row(
                children: <Widget>[
                  Text("Fresh Recommendations",
                      style: TextStyle(
                          fontSize: 25,
                          fontFamily: "Dancing",
                          fontWeight: FontWeight.bold)),
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
                                      contact: snapshot.data.documents[index]
                                          .data['contact'],
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
                                      address: snapshot.data.documents[index]
                                          .data["address"],
                                      documentId: snapshot.data.documents[index]
                                          .data["documentID"],
                                    );
                                  });
                            }))
                    : Container(
                        alignment: Alignment.center,
                        child: CircularProgressIndicator(),
                      ),
              ),
                AdmobBanner(
                  adUnitId: "ca-app-pub-5023637575934146/6848917213",
                  adSize: AdmobBannerSize.MEDIUM_RECTANGLE),
            
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
                                      contact: snapshot.data.documents[index]
                                          .data['contact'],
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
                                      address: snapshot.data.documents[index]
                                          .data["address"],
                                      documentId: snapshot.data.documents[index]
                                          .data["documentID"],
                                    );
                                  });
                            }))
                    : Container(
                        alignment: Alignment.center,
                        child: CircularProgressIndicator(),
                      ),
              ),

              AdmobBanner(
                  adUnitId: "ca-app-pub-5023637575934146/6848917213",
                  adSize: AdmobBannerSize.MEDIUM_RECTANGLE),
              //fashionstreamm
              Container(
                child: fashionStream != null
                    ? Container(
                        child: StreamBuilder(
                            stream: fashionStream,
                            builder: (context, snapshot) {
                              return ListView.builder(
                                  reverse: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  padding: EdgeInsets.symmetric(horizontal: 16),
                                  itemCount: snapshot.data.documents.length,
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    return Fashiontile(
                                      contact: snapshot.data.documents[index]
                                          .data['contact'],
                                      title: snapshot
                                          .data.documents[index].data["title"],
                                      description: snapshot
                                          .data.documents[index].data['desc'],
                                      image1Url: snapshot.data.documents[index]
                                          .data['fashion1imageurl'],
                                      image2Url: snapshot.data.documents[index]
                                          .data['fashion2imageurl'],
                                      price: snapshot
                                          .data.documents[index].data["price"],
                                      address: snapshot.data.documents[index]
                                          .data["address"],
                                      documentId: snapshot.data.documents[index]
                                          .data["documentID"],
                                    );
                                  });
                            }))
                    : Container(
                        alignment: Alignment.center,
                        child: CircularProgressIndicator(),
                      ),
              ),
              AdmobBanner(
                  adUnitId: "ca-app-pub-5023637575934146/6848917213",
                  adSize: AdmobBannerSize.MEDIUM_RECTANGLE),
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
                                      contact: snapshot.data.documents[index]
                                          .data['contact'],
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
                                      address: snapshot.data.documents[index]
                                          .data["address"],
                                      documentId: snapshot.data.documents[index]
                                          .data["documentID"],
                                    );
                                  });
                            }))
                    : Container(
                        alignment: Alignment.center,
                        child: CircularProgressIndicator(),
                      ),
              ),


AdmobBanner(
                  adUnitId: "ca-app-pub-5023637575934146/6848917213",
                  adSize: AdmobBannerSize.MEDIUM_RECTANGLE),
              //sportstream..
              Container(
                child: sportStream != null
                    ? Container(
                        child: StreamBuilder(
                            stream: sportStream,
                            builder: (context, snapshot) {
                              return ListView.builder(
                                  reverse: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  padding: EdgeInsets.symmetric(horizontal: 16),
                                  itemCount: snapshot.data.documents.length,
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    return Sporttile(
                                      contact: snapshot.data.documents[index]
                                          .data['contact'],
                                      title: snapshot
                                          .data.documents[index].data["title"],
                                      description: snapshot
                                          .data.documents[index].data['desc'],
                                      image1Url: snapshot.data.documents[index]
                                          .data['sport1imageurl'],
                                      image2Url: snapshot.data.documents[index]
                                          .data['sport2imageurl'],
                                      price: snapshot
                                          .data.documents[index].data["price"],
                                      address: snapshot.data.documents[index]
                                          .data["address"],
                                      documentId: snapshot.data.documents[index]
                                          .data["documentID"],
                                    );
                                  });
                            }))
                    : Container(
                        alignment: Alignment.center,
                        child: CircularProgressIndicator(),
                      ),
              ),
              AdmobBanner(
                  adUnitId: "ca-app-pub-5023637575934146/6848917213",
                  adSize: AdmobBannerSize.MEDIUM_RECTANGLE),
              Container(
                child: bookStream != null
                    ? Container(
                        child: StreamBuilder(
                            stream: bookStream,
                            builder: (context, snapshot) {
                              return ListView.builder(
                                  reverse: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  padding: EdgeInsets.symmetric(horizontal: 16),
                                  itemCount: snapshot.data.documents.length,
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    return Booktile(
                                      contact: snapshot.data.documents[index]
                                          .data['contact'],
                                      title: snapshot
                                          .data.documents[index].data["title"],
                                      description: snapshot
                                          .data.documents[index].data['desc'],
                                      image1Url: snapshot.data.documents[index]
                                          .data['book1imageurl'],
                                      image2Url: snapshot.data.documents[index]
                                          .data['book2imageurl'],
                                      price: snapshot
                                          .data.documents[index].data["price"],
                                      address: snapshot.data.documents[index]
                                          .data["address"],
                                      documentId: snapshot.data.documents[index]
                                          .data["documentID"],
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
