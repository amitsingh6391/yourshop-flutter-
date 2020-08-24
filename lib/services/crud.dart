import "package:cloud_firestore/cloud_firestore.dart";
import 'package:firebase_auth/firebase_auth.dart';
import "package:yourshop/pages/global.dart" as global;

class CrudMethods {
  // getCurrentUser() async {
  //   String userid;
  //   final FirebaseAuth _auth = FirebaseAuth.instance;
  //   final FirebaseUser user = await _auth.currentUser();
  //   final uid = user.uid;
  //   print(uid);
  //   userid = uid.toString();
  // }
  getData() async {
    return await Firestore.instance
        .collection("bike")
        .orderBy("time")
        .snapshots();
  }

  getelectronicData() async {
    return await Firestore.instance
        .collection("electronic")
        .orderBy("time")
        .snapshots();
  }

  getPhoneData() async {
    return await Firestore.instance
        .collection("phone")
        .orderBy("time")
        .snapshots();
  }

  getFashionData() async {
    return await Firestore.instance
        .collection("fashion")
        .orderBy("time")
        .snapshots();
  }

  getBookData() async {
    return await Firestore.instance
        .collection("book")
        .orderBy("time")
        .snapshots();
  }

  getSportData() async {
    return await Firestore.instance
        .collection("sport")
        .orderBy("time")
        .snapshots();
  }

   
}
