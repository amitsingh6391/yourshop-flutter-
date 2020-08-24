
import "package:cloud_firestore/cloud_firestore.dart";
import 'package:firebase_auth/firebase_auth.dart';

class CrudMethods {
String userid;
   getCurrentUser() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final FirebaseUser user = await _auth.currentUser();
    final uid = user.uid;
    print(uid);
    
      userid = uid.toString();
    
  }
  
   getuseradds() async {
    return await Firestore.instance.collection(userid).orderBy("time").snapshots();
  }

}