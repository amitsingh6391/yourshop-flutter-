import 'package:cached_network_image/cached_network_image.dart';
import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
import 'package:link_text/link_text.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:yourshop/pages/socialmedia.dart';
import 'package:yourshop/pages/uploaduserprofile.dart';

import 'package:yourshop/phonefulldetail.dart';
import 'package:yourshop/view/SignIn.dart';
import 'package:yourshop/view/helper/authnicate.dart';
import 'package:yourshop/view/viewservices/auth.dart';
import "package:cloud_firestore/cloud_firestore.dart";
import 'package:flutter_share/flutter_share.dart';

import "package:yourshop/services/crud.dart";

class Profilescreen extends StatefulWidget {
  @override
  _ProfilescreenState createState() => _ProfilescreenState();
}

class _ProfilescreenState extends State<Profilescreen> {
  String userid;
  //String instagram,linkdin,github;

  @override
  void initState() {
    // TODO: implement initState
    getCurrentUser();
    super.initState();
  }

  Future<void> share() async {
    try {
      Share.text(
          'Yourshop',
          'https://play.google.com/store/apps/details?id=com.yourshop.amitapps',
          'text/plain');
    } catch (e) {
      print('error: $e');
    }
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
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
                child: Column(
      children: <Widget>[
        Row(
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
        Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: <Widget>[
              StreamBuilder(
                  stream: Firestore.instance
                      .collection("userprofile")
                      .document(userid)
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Text("Loading");
                    }

                    var Profiledetail = snapshot.data;
                    var instagram = Profiledetail["insta"];
                    var linkdin = Profiledetail["linkdin"];
                    var github = Profiledetail["github"];
                    print(github);
                    return Column(children: <Widget>[
                      Row(children: [
                        ClipOval(
                            child: CachedNetworkImage(
                                imageUrl: Profiledetail["profileimageurl"],
                                height: 150,
                                width: 150,
                                fit: BoxFit.cover)),

                        //Text("You Refer Code"),

                        Column(children: [
                          Text("Share and earn cashback "),
                          Text("Your Refer Code",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red,
                                  fontFamily: "Dancing")),
                          SizedBox(height: 10),
                          Container(
                            child: Text(userid,
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold)),
                          ),
                        ]),
                      ]),
                      Row(children: [
                        Text(Profiledetail["username"],
                            style: TextStyle(
                                fontSize: 20,
                                fontFamily: "Dancing",
                                fontWeight: FontWeight.bold)),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        Socialmedia(link: github)));
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircleAvatar(
                              radius: 25,
                              backgroundImage:
                                  AssetImage("assets/images/instaicon.jpg"),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        Socialmedia(link: instagram)));
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircleAvatar(
                              radius: 25,
                              backgroundImage:
                                  AssetImage("assets/images/facebook.png"),
                            ),
                          ),
                        ),

                        
                        
                        SizedBox(width: 10),
                        GestureDetector(
                          onTap: () {
                            share();
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(Icons.share,size:30)
                          ),
                        ),
SizedBox(width:10),
                        GestureDetector(
                          onTap: () {
                            launch("https://play.google.com/store/apps/details?id=com.yourshop.amitapps");
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(Icons.star,size:30)
                          ),
                        ),
                      ]),
                      Row(
                        children: <Widget>[
                          Text("Bio :",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: "Dancing",
                                  fontWeight: FontWeight.bold)),
                          SizedBox(width: 80),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          UploaduserProfile()));
                            },
                            child: Card(
                              child: Container(
                                  //color:Colors.black,
                                  height: 30,
                                  child: Text("EditProfile",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontFamily: "Dancing",
                                          fontWeight: FontWeight.bold,
                                          color: Colors.green))),
                            ),
                          ),
                          SizedBox(width: 50),
                          GestureDetector(
                            onTap: () {
                              AuthService().signOut();
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Authenticate()));
                            },
                            child: Container(
                                height: 30,
                                child: Text("LogOut",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontFamily: "Dancing",
                                        fontWeight: FontWeight.bold,
                                        color: Colors.red))),
                          ),
                        ],
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Text(Profiledetail["bio"],
                            style:
                                TextStyle(fontSize: 17, fontFamily: "Dancing")),
                      ),
                    ]);
                  }),
              Text("MyAdds",
                  style: TextStyle(fontSize: 17, fontFamily: "Dancing")),
              StreamBuilder(
                stream: Firestore.instance
                    .collection("useradds")
                    .document(userid)
                    .collection("adds")
                    .snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Text("Loading");
                  }

                  return ListView.builder(
                      reverse: true,
                      physics: NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      itemCount: snapshot.data.documents.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return AddTile(
                          contact:
                              snapshot.data.documents[index].data['contact'],
                          title: snapshot.data.documents[index].data["title"],
                          description:
                              snapshot.data.documents[index].data['desc'],
                          image1Url:
                              snapshot.data.documents[index].data['image1url'],
                          image2Url:
                              snapshot.data.documents[index].data['image2url'],
                          price: snapshot.data.documents[index].data["price"],
                          address:
                              snapshot.data.documents[index].data["address"],
                          documentId:
                              snapshot.data.documents[index].data["documentID"],
                        );
                      });
                },
              )
            ],
          ),
        )
      ],
    ))));
  }
}

class AddTile extends StatefulWidget {
  String title,
      description,
      image1Url,
      image2Url,
      contact,
      price,
      address,
      documentId;

  AddTile({
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
  _AddTileState createState() => _AddTileState();
}

class _AddTileState extends State<AddTile> {
  BuildContext context;
  Stream ecstream;
  CrudMethods crudMethods = CrudMethods();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
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
    ));
  }
}
