// ignore_for_file: prefer_const_constructors, unnecessary_const

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:webullishappnew/view/Auth/resetpassword.dart';
import 'package:webullishappnew/view/Auth/signup.dart';
import 'package:webullishappnew/view/Home/home.dart';

class login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return loinstate();
  }
}

class loinstate extends State<login> {
  final email = TextEditingController();
  final password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Image.asset(
                'assets/images/webullishlogo.png',
                width: size.width * 0.5,
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: TextField(
                  controller: email,
                  style: TextStyle(color: Colors.white),
                  // ignore: unnecessary_new
                  decoration: new InputDecoration(
                    prefixIcon: Icon(
                      Icons.email,
                      color: Colors.white,
                    ),
                    hintText: "Email ID..",
                    labelStyle: TextStyle(color: Colors.white),
                    hintStyle: TextStyle(color: Colors.white),
                    enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      borderSide: const BorderSide(
                        color: Colors.white,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: TextField(
                  obscureText: true, style: TextStyle(color: Colors.white),
                  controller: password,
                  // ignore: unnecessary_new
                  decoration: new InputDecoration(
                    prefixIcon: Icon(
                      Icons.password_sharp,
                      color: Colors.white,
                    ),
                    hintText: "Password..",
                    hintStyle: TextStyle(color: Colors.white),
                    enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      borderSide: const BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Get.to(resetpassword());
                },
                child: Container(
                    margin: EdgeInsets.all(10),
                    alignment: Alignment.centerRight,
                    child: Text(
                      'Forget password',
                      style: TextStyle(color: Colors.grey),
                    )),
              ),
              SizedBox(
                height: 50,
              ),
              InkWell(
                onTap: () async {
                  if (email.text.trim().isEmpty ||
                      password.text.trim().isEmpty) {
                    Fluttertoast.showToast(
                      msg: "Enter Email and Password",
                      toastLength: Toast.LENGTH_SHORT,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.grey,
                      textColor: Colors.white,
                      fontSize: 16.0,
                    );
                    return;
                  }
                  try {
                    // ignore: unused_local_variable
                    final credential = await FirebaseAuth.instance
                        .signInWithEmailAndPassword(
                            email: email.text.trim(),
                            password: password.text.trim());
                    Get.to(home());
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'user-not-found') {
                      Fluttertoast.showToast(
                        msg: "user-not-found",
                        toastLength: Toast.LENGTH_SHORT,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.grey,
                        textColor: Colors.white,
                        fontSize: 16.0,
                      );
                    } else if (e.code == 'wrong-password') {
                      Fluttertoast.showToast(
                        msg: "wrong-password",
                        toastLength: Toast.LENGTH_SHORT,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.grey,
                        textColor: Colors.white,
                        fontSize: 16.0,
                      );
                    }
                  }
                },
                child: Container(
                    alignment: Alignment.center,
                    height: 50,
                    width: size.width * 0.7,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.grey),
                    child: Text(
                      'Login',
                      style: TextStyle(
                          fontSize: 17,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    )),
              ),
              SizedBox(
                height: 70,
              ),
              // ignore: avoid_unnecessary_containers
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('New To Webullish ? ',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold)),
                    InkWell(
                      onTap: () {
                        Get.to(register());
                      },
                      child: Text('Register Now ',
                          style: TextStyle(color: Colors.grey)),
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }
}
