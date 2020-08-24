//neeraj code

import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';
import 'package:yourshop/pages/Homescreen.dart';
import 'package:yourshop/view/viewservices/auth.dart';
import 'package:yourshop/view/viewservices/database.dart';
import 'package:yourshop/view/widgets/widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import "package:flutter/material.dart";

import "package:yourshop/view/helper/helperfunction.dart";

class SignUp extends StatefulWidget {
  final Function toggleView;
  SignUp(this.toggleView);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController emailEditingController = new TextEditingController();
  TextEditingController passwordEditingController = new TextEditingController();
  TextEditingController referalEditingController = new TextEditingController();
 TextEditingController paytmEditingController = new TextEditingController();
  // TextEditingController phoneEditingController = new TextEditingController();
  // TextEditingController branchEditingController = new TextEditingController();
  // TextEditingController yearEditingController = new TextEditingController();

  AuthService authService = new AuthService();

  DatabaseMethods databaseMethods = new DatabaseMethods();

  final formKey = GlobalKey<FormState>();
  bool isLoading = false;

  String userid;
 
  singUp() async {
    if (formKey.currentState.validate()) {
      setState(() {
        isLoading = true;
      });

      await authService
          .signUpWithEmailAndPassword(
              emailEditingController.text, passwordEditingController.text)
          .then((result) {
        if (result != null) {
          Map<String, String> userDataMap = {
            "userEmail": emailEditingController.text,
          };

          databaseMethods.addUserInfo(userDataMap);

          HelperFunctions.saveUserLoggedInSharedPreference(true);

          HelperFunctions.saveUserEmailSharedPreference(
              emailEditingController.text);

          

          getCurrentUser();
        }
      });
    }

    // uploaduserprofile();
  }

  getCurrentUser() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final FirebaseUser user = await _auth.currentUser();
    final uid = user.uid;
    print(uid);
    setState(() {
      userid = uid.toString();
    });

    addnewuserprofile();
  }

  addnewuserprofile() async {
    await Firestore.instance
        .collection("userprofile")
        .document(userid)
        .setData({
      "profileimageurl": "https://www.pngitem.com/pimgs/m/146-1468479_my-profile-icon-blank-profile-picture-circle-hd.png",
      "contact": "Not provides",
      "username": "Abc",
      "bio": "None",
      "github":"https://github.com",
      "linkdin":"https://www.linkedin.com/home",
      "insta":"https://www.instagram.com",

      'time': DateTime.now().millisecondsSinceEpoch,
      "referalcode":referalEditingController.text,
      "paytmnumber":paytmEditingController.text
    });

    Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => Homescreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // resizeToAvoidBottomInset: true,
      resizeToAvoidBottomPadding: false,
      body: isLoading
          ? Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : SafeArea(
              child: Container(
                //padding: EdgeInsets.symmetric(horizontal: 24),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height / 3,
                        child: Row(children: [
                          Stack(
                            children: [
                              Image(
                                image:
                                    AssetImage("assets/images/signup_top.png"),
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 20, top: 50),
                                child: Text("Your",
                                    style: TextStyle(
                                        fontSize: 40,
                                        fontFamily: "Dancing",
                                        color: Colors.purple,
                                        fontWeight: FontWeight.bold)),
                              ),
                              Container(
                                  padding: EdgeInsets.only(left: 60, top: 145),
                                  child: Text("Shop",
                                      style: TextStyle(
                                          fontSize: 30,
                                          fontFamily: "Dancing",
                                          color: Colors.deepPurpleAccent,
                                          fontWeight: FontWeight.bold))),
                              Container(
                                margin: EdgeInsets.only(left: 150, top: 20),
                                child: Image(
                                    height: 300,
                                    width: 100,
                                    image: AssetImage(
                                        "assets/images/signup_top.png")),
                              ),
                            ],
                          ),
                        ]),
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: <Widget>[
                          Text("Create a New  account : ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                fontFamily: "Dancing",
                                color: Colors.deepPurpleAccent,
                              )),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 20, top: 10, right: 20),
                        child: Container(
                          decoration: BoxDecoration(
                              // border: Border.all(
                              //     color: Colors.redAccent, width: 10),
                              borderRadius: BorderRadius.circular(30)),
                          child: Form(
                            key: formKey,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextFormField(
                                    controller: emailEditingController,
                                    style: simpleTextStyle(),
                                    validator: (val) {
                                      return RegExp(
                                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                              .hasMatch(val)
                                          ? null
                                          : "Enter correct email";
                                    },
                                    // decoration: textFieldInputDecoration("email"),
                                    decoration: InputDecoration(
                                        hintText: "Email",
                                        border: OutlineInputBorder(
                                            borderSide:
                                                BorderSide(color: Colors.red),
                                            borderRadius:
                                                BorderRadius.circular(10))),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextFormField(
                                    obscureText: true,
                                    style: simpleTextStyle(),
                                    // decoration: textFieldInputDecoration("password"),
                                    controller: passwordEditingController,
                                    validator: (val) {
                                      return val.length < 6
                                          ? "Enter Password 6+ characters"
                                          : null;
                                    },
                                    decoration: InputDecoration(
                                        hintText: "password",
                                        border: OutlineInputBorder(
                                            borderSide:
                                                BorderSide(color: Colors.red),
                                            borderRadius:
                                                BorderRadius.circular(10))),
                                  ),
                                ),

                                  Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextFormField(
                                    obscureText: true,
                                    style: simpleTextStyle(),
                                    // decoration: textFieldInputDecoration("password"),
                                    controller: referalEditingController,
                                   
                                    decoration: InputDecoration(
                                        hintText: "Referal code (optional)",
                                        border: OutlineInputBorder(
                                            borderSide:
                                                BorderSide(color: Colors.red),
                                            borderRadius:
                                                BorderRadius.circular(10))),
                                  ),
                                ),

                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextFormField(
                                    obscureText: true,
                                    style: simpleTextStyle(),
                                    // decoration: textFieldInputDecoration("password"),
                                    controller: paytmEditingController,
                                   
                                    decoration: InputDecoration(
                                        hintText: "Paytm or phone pay for cashback (optional)",
                                        border: OutlineInputBorder(
                                            borderSide:
                                                BorderSide(color: Colors.red),
                                            borderRadius:
                                                BorderRadius.circular(10))),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 20, top: 5, right: 20),
                        child: GestureDetector(
                          onTap: () {
                            singUp();
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width / 2,
                            padding: EdgeInsets.symmetric(vertical: 16),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                gradient: LinearGradient(
                                  colors: [Colors.redAccent, Colors.redAccent],
                                )),
                            // width: MediaQuery.of(context).size.width,
                            child: Text(
                              "Sign Up",
                              style: biggerTextStyle(),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Already have an account? ",
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: "Dancing",
                                color: Colors.deepPurpleAccent,
                              )),
                          GestureDetector(
                            onTap: () {
                              widget.toggleView();
                            },
                            child: Text(
                              "SignIn now",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: "Dancing",
                                  color: Colors.purple,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 50,
                      )
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
