import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:webullishappnew/Model/notificationModel.dart';
import 'package:webullishappnew/view/Home/Widgets/last_notification.dart';

class homeController extends GetxController {
  var db = FirebaseFirestore.instance;
  var user = FirebaseAuth.instance;
  double dot = 0;

  homeController() {
    getpremcheck();
    get_today_top_alert();
    getname();
    getlast();
  }
  notificationModel? lastnotification;
  getlast() async {
    db
        .collection('notifications')
        .doc(user.currentUser!.uid)
        .collection('notifications')
        .doc('last')
        .get()
        .then((value) {
      if (value.data() == null) {
        lastnotification = notificationModel(
            senttime: DateFormat('yyyy-MM-dd – kk:mm').format(DateTime.now()),
            title: 'Welcom to webullish',
            body: ' ',
            image:
                'https://firebasestorage.googleapis.com/v0/b/webullish-14c86.appspot.com/o/webullishicon.png?alt=media&token=5fa8bd4e-11b4-4959-a0dd-99b009bbb826');

        update();
        return;
      }
      if (ispremuim == 'no') {
        lastnotification = notificationModel(
            senttime: DateFormat('yyyy-MM-dd – kk:mm').format(DateTime.now()),
            title: 'Subscribe Now ',
            body: ' ',
            image:
                'https://firebasestorage.googleapis.com/v0/b/webullish-14c86.appspot.com/o/webullishicon.png?alt=media&token=5fa8bd4e-11b4-4959-a0dd-99b009bbb826');

        update();
        return;
      }
      lastnotification = notificationModel.fromjson(value.data()!);
      update();
    });
  }

  String ispremuim = 'no';
  getpremcheck() async {
    await db
        .collection('subscriptions')
        .doc(user.currentUser!.uid)
        .get()
        .then((value) {
      ispremuim = value.get('ispremuim');

      update();
    });
    update();
  }

  String name = ' ';
  getname() async {
    await db
        .collection('users')
        .doc(user.currentUser!.uid)
        .get()
        .then((value) => {name = value.get('name')});
    update();
  }

  // ignore: non_constant_identifier_names
  List top_alert_list = [];
  // ignore: non_constant_identifier_names
  get_today_top_alert() async {
    db.collection('topalerts').get().then((value) {
      if (value.docs.isEmpty) {
        return;
      }
      for (int i = 0; i < value.docs.length; i++) {
        top_alert_list.add(value.docs[i].get('image'));
        update();
      }
      update();
    });
    update();
  }

  updatedot(Index) {
    dot = Index;
    update();
  }
}
