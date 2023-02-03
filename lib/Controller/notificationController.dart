import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../Model/notificationModel.dart';

// ignore: camel_case_types
class notificationController extends GetxController {
  List<notificationModel> notificationlist = [];
  bool loading = true;
  FirebaseFirestore db = FirebaseFirestore.instance;
  final user = FirebaseAuth.instance.currentUser;
  notificationController() {
    getnotifications();
  }
  getnotifications() async {
    db
        .collection('notifications')
        .doc(user!.uid)
        .collection('notifications')
        .orderBy('senttime', descending: true)
        .get()
        .then((value) {
      for (int i = 0; i < value.docs.length; i++) {
        notificationlist.add(notificationModel.fromjson(value.docs[i].data()));
      }
      loading = false;
      update();
    });
  }
}
