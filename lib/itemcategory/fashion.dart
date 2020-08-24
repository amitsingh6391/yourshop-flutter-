import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import "package:flutter/material.dart";
import "dart:io";
import 'package:image_picker/image_picker.dart';
import 'package:random_string/random_string.dart';
import 'package:image_cropper/image_cropper.dart';
import "package:intl/intl.dart";
import 'package:yourshop/categorywiseproduct/fashiondata.dart';

import "package:yourshop/pages/Homescreen.dart";

class Fashiondataupload extends StatefulWidget {
  @override
  _FashiondatauploadState createState() => _FashiondatauploadState();
}

class _FashiondatauploadState extends State<Fashiondataupload> {
  String title, desc, contact, price, address;


   @override
  void initState() {
    // TODO: implement initState

    getCurrentUser();

    super.initState();
  }

String userid;
   getCurrentUser() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final FirebaseUser user = await _auth.currentUser();
    final uid = user.uid;
    print(uid);
    setState(() {
      userid = uid.toString();
    });
  }   

  File selected1Image;
  File selected2Image;
  bool _isLoading = false;
  final picker = ImagePicker();
  DateTime now = DateTime.now();
  Future<void> getImage() async {
    var image = await picker.getImage(source: ImageSource.gallery);

    cropImage(image);
  }

  Future<void> getImagefromcamera() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    cropImage(image);
  }

  cropImage(var image) async {
    File croppedImage = await ImageCropper.cropImage(
        sourcePath: image.path, compressQuality: 40);

    setState(() {
      selected1Image = croppedImage;
    });
  }

  //for imageicon...

  Future<void> getIcon() async {
    var icon = await picker.getImage(source: ImageSource.gallery);

    cropIcon(icon);
  }

  cropIcon(var icon) async {
    File croppedIcon = await ImageCropper.cropImage(
        sourcePath: icon.path, compressQuality: 40);

    setState(() {
      selected2Image = croppedIcon;
    });
  }

  uploadBlog() async {
    if (selected2Image != null && selected1Image != null) {
      setState(() {
        _isLoading = true;
        // print("hii");
      });

      /// uploading image to firebase storage
      StorageReference firebaseStorageRefe = FirebaseStorage.instance
          .ref()
          .child("fashion1Images")
          .child("${randomAlphaNumeric(9)}.jpg");

      final StorageUploadTask tasks =
          firebaseStorageRefe.putFile(selected1Image);

      var fashion1imageUrl = await (await tasks.onComplete).ref.getDownloadURL();
      print("this is url $fashion1imageUrl");

      //for icons...

      StorageReference firebaseStorageRef = FirebaseStorage.instance
          .ref()
          .child("fashion2image")
          .child("${randomAlphaNumeric(9)}.jpg");

      final StorageUploadTask task = firebaseStorageRef.putFile(selected2Image);

      var fashion2imageurl = await (await task.onComplete).ref.getDownloadURL();
      print("this is url $fashion2imageurl");

      var rng = new Random();
      String documentID = rng.nextInt(1000000).toString();

      await Firestore.instance
          .collection("fashion")
          .document(documentID)
          .setData({
        "fashion1imageurl": fashion1imageUrl,
        "fashion2imageurl": fashion2imageurl,
        "contact": contact,
        "title": title,
        "desc": desc,
        "price": price,
        "address": address,
        'time': DateTime.now().millisecondsSinceEpoch,
        "posttime": DateFormat("MM-dd - kk:mm").format(now),
        "documentID": documentID
      });
       await Firestore.instance.collection("useradds").document(userid).collection("adds").document(documentID)
.setData({

       "image1url":fashion1imageUrl,
       "image2url":fashion2imageurl,
        "contact":contact,
        "title": title,
        "desc": desc,
        "price":price,
        "address":address,
        'time': DateTime.now().millisecondsSinceEpoch,
        "posttime": DateFormat("MM-dd - kk:mm").format(now),
       
        "documentID":documentID
           
         }).then((result){
           Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Fashiondata(),
            ));
       
         });
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: _isLoading
          ? Container(
              alignment: Alignment.center,
              child: CircularProgressIndicator(),
            )
          : SafeArea(
              child: SingleChildScrollView(
                child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(children: <Widget>[
                      SizedBox(
                        height: 10,
                      ),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 50,
                          child: Card(
                              child: Text("Fill these details..",
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold))),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          child: Column(
                            children: <Widget>[
                              TextField(
                                decoration: InputDecoration(
                                  labelText: "Title",
                                  hintText: " Product tite.....",
                                  border: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black)),
                                ),
                                onChanged: (val) {
                                  title = val;
                                },
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              TextField(
                                decoration: InputDecoration(
                                  labelText: "Description",
                                  hintText: "Description",
                                  border: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.yellow)),
                                ),
                                onChanged: (val) {
                                  desc = val;
                                },
                              ),
                              SizedBox(height: 10),
                              TextField(
                                decoration: InputDecoration(
                                  labelText: "contact no.",
                                  hintText: "Contact number",
                                  border: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black)),
                                ),
                                onChanged: (val) {
                                  contact = val;
                                },
                              ),
                              SizedBox(height: 10),
                              TextField(
                                decoration: InputDecoration(
                                  labelText: "Price",
                                  hintText: "Price",
                                  border: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black)),
                                ),
                                onChanged: (val) {
                                  price = val;
                                },
                              ),
                              SizedBox(height: 10),
                              TextField(
                                decoration: InputDecoration(
                                  labelText: "Address",
                                  hintText: "Address",
                                  border: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black)),
                                ),
                                onChanged: (val) {
                                  address = val;
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                          onTap: () {
                            getImage();
                          },
                          child: selected1Image != null
                              ? Container(
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [Colors.black26, Colors.black45],
                                    ),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  margin: EdgeInsets.symmetric(horizontal: 16),
                                  height: 250,
                                  width: MediaQuery.of(context).size.width,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(6),
                                    child: Image.file(
                                      selected1Image,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                )
                              : Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Card(
                                    color: Colors.black,
                                    child: Container(
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 16),
                                      height: 200,
                                      decoration: BoxDecoration(
                                          gradient: LinearGradient(colors: [
                                            Colors.black12,
                                            Colors.black12
                                          ]),
                                          borderRadius:
                                              BorderRadius.circular(50)),
                                      width: MediaQuery.of(context).size.width,
                                      child: Column(
                                        children: <Widget>[
                                          Text("Slect 1 image",
                                              style: TextStyle(
                                                  color: Colors.white)),
                                          IconButton(
                                            tooltip: "take image from phone",
                                            color: Colors.white,
                                            icon: Icon(Icons.image),
                                            iconSize: 50,
                                            onPressed: () {
                                              getImage();
                                            },
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          IconButton(
                                              onPressed: () {
                                                getImagefromcamera();
                                              },
                                              tooltip: "take image from camera",
                                              icon: Icon(Icons.camera_alt),
                                              color: Colors.white,
                                              iconSize: 40),
                                        ],
                                      ),
                                    ),
                                  ),
                                )),
                      SizedBox(height: 20),
                      GestureDetector(
                          onTap: () {
                            getIcon();
                          },
                          child: selected2Image != null
                              ? Container(
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [Colors.black26, Colors.black45],
                                    ),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  margin: EdgeInsets.symmetric(horizontal: 16),
                                  height: 250,
                                  width: MediaQuery.of(context).size.width,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(6),
                                    child: Image.file(
                                      selected2Image,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                )
                              : Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Card(
                                    color: Colors.black,
                                    elevation: 20,
                                    child: Container(
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 16),
                                      height: 200,
                                      decoration: BoxDecoration(
                                          gradient: LinearGradient(colors: [
                                            Colors.black12,
                                            Colors.black12
                                          ]),
                                          borderRadius:
                                              BorderRadius.circular(50)),
                                      width: MediaQuery.of(context).size.width,
                                      child: Column(
                                        children: <Widget>[
                                          Text(
                                            "Slect 2 image ",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          IconButton(
                                            tooltip: "take image from phone",
                                            color: Colors.white,
                                            icon: Icon(Icons.image),
                                            iconSize: 50,
                                            onPressed: () {
                                              getIcon();
                                            },
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          IconButton(
                                              onPressed: () {
                                                getIcon();
                                              },
                                              tooltip: "take image from camera",
                                              icon: Icon(Icons.camera_alt),
                                              color: Colors.white,
                                              iconSize: 50),
                                        ],
                                      ),
                                    ),
                                  ),
                                )),
                      // SizedBox(
                      //   height: 5,
                      // ),

                      SizedBox(height: 10),
                      Text("upload product"),
                      GestureDetector(
                          onTap: () {
                            uploadBlog();
                          },
                          child: Icon(
                            Icons.cloud_upload,
                            size: 100,
                          ))
                    ])),
              ),
            ),
    );
  }
}
