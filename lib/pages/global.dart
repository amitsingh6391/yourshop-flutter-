library my_project.global;

import "package:flutter/material.dart";

import 'package:firebase_auth/firebase_auth.dart';
 String userid;

 getCurrentUser() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final FirebaseUser user = await _auth.currentUser();
    final uid = user.uid;
    print(uid);
   
       userid = uid.toString();
   
  }