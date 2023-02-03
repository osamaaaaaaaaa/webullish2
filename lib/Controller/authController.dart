import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../Model/subscriptionModel.dart';
import '../Model/userModel.dart';
import '../view/Home/home.dart';

class authController extends GetxController {
  FirebaseFirestore db = FirebaseFirestore.instance;
  final user = FirebaseAuth.instance.currentUser;
  String? token;
  authController() {}
  // gettoken() async {
  //   final fcmToken = await FirebaseMessaging.instance.getToken();
  //   token = fcmToken;

  //   update();
  //   print(token.toString());
  // }

  signin(email, password) async {
    if (email.trim().isEmpty || password.text.trim().isEmpty) {
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
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email.text.trim(), password: password.trim());
      //  Get.to(bottomnavigation());
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
    update();
  }

  signup(userModel model) async {
    if (model.email.trim().isEmpty || model.password.trim().isEmpty) {
      Fluttertoast.showToast(
        msg: "Enter Email and Password",
        toastLength: Toast.LENGTH_SHORT,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.white,
        textColor: Colors.black,
        fontSize: 16.0,
      );
      return;
    }
    try {
      // ignore: unused_local_variable
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: model.email,
        password: model.password,
      );
      addusertodb(model, credential);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
      } else if (e.code == 'email-already-in-use') {}
    } catch (e) {
      print(e);
    }
    update();
  }

  addusertodb(userModel model, UserCredential credential) async {
    await db.collection('users').doc(credential.user!.uid).set(model.tojson());
    await db.collection('subscriptions').doc(credential.user!.uid).set(
        subscriptionsModel(
                date: DateTime.now().toString(),
                freetrial: 'no',
                ispremum: 'no',
                token: token.toString(),
                type: 'type')
            .tojson());
    update();
    Get.to(home());
  }
}
