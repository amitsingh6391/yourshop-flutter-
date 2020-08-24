



import 'package:yourshop/pages/Homescreen.dart';
import 'package:yourshop/view/helper/helperfunction.dart';

import 'package:yourshop/view/helper/theme.dart';

import 'package:yourshop/view/viewservices/auth.dart';

import 'package:yourshop/view/viewservices/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import "package:flutter/material.dart";
import 'package:yourshop/view/widgets/widget.dart';

import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;

  SignIn(this.toggleView);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController emailEditingController = new TextEditingController();
  TextEditingController passwordEditingController = new TextEditingController();

  AuthService authService = new AuthService();

  final formKey = GlobalKey<FormState>();

  bool isLoading = false;

  signIn() async {
    if (formKey.currentState.validate()) {
      setState(() {
        isLoading = true;
      });

      await authService
          .signInWithEmailAndPassword(
              emailEditingController.text, passwordEditingController.text)
          .then((result) async {
        if (result != null) {
          QuerySnapshot userInfoSnapshot =
              await DatabaseMethods().getUserInfo(emailEditingController.text);

          HelperFunctions.saveUserLoggedInSharedPreference(true);
          HelperFunctions.saveUserNameSharedPreference(
              userInfoSnapshot.documents[0].data["userName"]);
          HelperFunctions.saveUserEmailSharedPreference(
              userInfoSnapshot.documents[0].data["userEmail"]);

          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => Homescreen()));
        } else {
          setState(() {
            isLoading = false;
            //show snackbar
          });
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      
       backgroundColor:Colors.white,
      body: isLoading
          ? Container(
              child: Center(child: CircularProgressIndicator()),
            )
          : SafeArea(
                      child: SingleChildScrollView(
                        child: Container(
                  //padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    children: [
                    Container(
                      height:MediaQuery.of(context).size.height/3,
                      child: Row(
                        children:[



                           Stack(
                             children:[
                               

                              Image(image:AssetImage("assets/images/main_top.png"),),
                              Container(
                                padding:EdgeInsets.only(left:20,top: 50),
                                child: Text("Your",
                                style: TextStyle(fontSize:40,fontFamily:"Dancing",color: Colors.purple,
                                fontWeight: FontWeight.bold)),
                              ),
                              Container(
                                    padding:EdgeInsets.only(left:60,top: 145),
                                child: Text("Shop",
                                 style: TextStyle(fontSize:30,fontFamily:"Dancing",color: Colors.deepPurpleAccent,
                                fontWeight: FontWeight.bold)
                                )),
                              
                         
                          Container(
                             margin: EdgeInsets.only(left:150,top:20),
                             child: Image(
                          height: 300,
                          width:100,
                          image:AssetImage("assets/images/main_top.png")),
                           ),
                           Container(
                             margin: EdgeInsets.only(left:60,top:100),
                             child: Image(
                          height: 300,
                          width:100,
                          image:AssetImage("assets/images/main_top.png")),
                           ),

                              ],),
                               
                          

                        ]
                      ),
                    ),
                      Container(
                         padding: EdgeInsets.only(left:20,top:50,right:20),
                        child: Container(
                           decoration: BoxDecoration(
                          //  border: Border.all(
                          //    color:Colors.purpleAccent,
                          //    width: 10

                          //  ),
                           borderRadius: BorderRadius.circular(30)
                             
                             ),
                            
                            child: Form(
                              key: formKey,
                              child: Column(
                                children: [
                                  Column(
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: TextFormField(
                                          
                                          validator: (val) {
                                            return RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(val)
                                                ? null
                                                : "Please Enter Correct Email";
                                          },
                                          controller: emailEditingController,
                                          style: simpleTextStyle(),
                                         // decoration: textFieldInputDecoration("email"),
                                         decoration: InputDecoration(
                                         
                                          hintText: "Email",
                                          border:OutlineInputBorder(

                                            borderSide: BorderSide(color:Colors.red),
                                            borderRadius: BorderRadius.circular(10)

                                          )
                                         ),
                                        ),
                                      ),
                                    ],
                                  ),
                                 Container(height:10,color:Colors.white),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextFormField(
                                      obscureText: true,
                                      validator: (val) {
                                        return val.length > 6
                                            ? null
                                            : "Enter Password 6+ characters";
                                      },
                                      style: simpleTextStyle(),
                                      controller: passwordEditingController,
                                      //decoration: textFieldInputDecoration("password"),
                                       decoration: InputDecoration(
                                         
                                          hintText: "Password",
                                          border:OutlineInputBorder(

                                            borderSide: BorderSide(color:Colors.red),
                                            borderRadius: BorderRadius.circular(10)

                                          )
                                         ),
                                    ),
                                  ),
                                  //SizedBox(height:20),
                                ],
                              ),
                            ),
                          ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => MyApps()));
                            },
                            child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 8),
                                child: Text(
                                  "Forgot Password?",
                                  //style: simpleTextStyle(),
                                   style: TextStyle(fontSize:20,fontFamily:"Dancing",color: Colors.deepPurpleAccent,
                                fontWeight: FontWeight.bold)
                                )),
                          )
                        ],
                      ),
                      
                      Container(
                        padding: EdgeInsets.only(left:20,top:5,right:20),
                        child: Row(
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {
                                signIn();
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 16),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    gradient: LinearGradient(
                                      colors: [
                                      
                                       Colors.purpleAccent,
                                       Colors.purpleAccent,
                                      ],
                                    )),
                                width: MediaQuery.of(context).size.width/2,
                                child: Text(
                                  "Sign In",
                                  style: biggerTextStyle(),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            
                          ],
                        ),
                      ),
                      
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have account? ",
                            //style: simpleTextStyle(),
                             style: TextStyle(fontSize:20,fontFamily:"Dancing",color: Colors.deepPurpleAccent,
                                fontWeight: FontWeight.bold)
                          ),
                          SizedBox(width:5),
                          GestureDetector(
                            onTap: () {
                              widget.toggleView();
                            },
                            child: Text(
                              "Register now",
                              style: TextStyle(fontSize:20,fontFamily:"Dancing",color: Colors.purpleAccent,
                                fontWeight: FontWeight.bold)
                            ),
                          ),
                        ],
                      ),
                     
                      Container(
                        padding: EdgeInsets.only(left:20,top:35,right:20),
                        child:Row(
                        children: <Widget>[
                          Card(
                                                      child: FlatButton(
                              onPressed: _urllauncher,
                            child:Text(
                              "Privacy Policy",
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.bold
                              ),

                            )),
                          ),
                          Card(
                                                      child: FlatButton(
                                onPressed: _terms,
                                child:Text(
                                  "Terms & Condition",
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold
                                  ),

                                )
                            ),
                          )
                        ],

                      ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.only(left:35,right:25),
                        child: Row(
                          children: <Widget>[
                            Container(constraints: BoxConstraints(maxWidth: 300),
                                child:
                            Text("By continuing you agree to our terms of service and privacy policy",
                              style: TextStyle(fontSize:15,fontFamily:"Dancing",color: Colors.black,
                                )
                            )
                            ),],
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                    ],
                  ),
                ),
            ),
          ),
    );
  }
}
_urllauncher() async {
  const url = 'https://mytrain.flycricket.io/privacy.html';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
_terms() async {
  const url = 'https://mytrain.flycricket.io/terms.html';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
