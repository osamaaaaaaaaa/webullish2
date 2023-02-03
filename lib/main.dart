import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:webullishappnew/binding/binding.dart';
import 'package:webullishappnew/view/Auth/login.dart';
import 'package:webullishappnew/view/Home/home.dart';
import 'package:webullishappnew/view/onboarding.dart';
import 'Model/notificationModel.dart';
import 'firebase_options.dart';

const stripePublishableKey = 'pk_live_hxiKd2gWhLR0sXINKQ5lv8As004zRq5swp';
FirebaseFirestore db = FirebaseFirestore.instance;
final user = FirebaseAuth.instance.currentUser;
bool userstate = true;
int? onboard;
Widget? widget;
FirebaseMessaging messaging = FirebaseMessaging.instance;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Stripe.publishableKey = stripePublishableKey;
  await Stripe.instance.applySettings();
  await FirebaseMessaging.instance.subscribeToTopic("topic");
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  getuserstate();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  onboard = prefs.getInt('onBoard');
  forgroundnotifocations();

  //getprem();
  runApp(MyApp());
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  addnotificationtodb(notificationModel(
      senttime: DateFormat('yyyy-MM-dd – kk:mm').format(DateTime.now()),
      body: message.notification!.body.toString(),
      image: message.notification!.android!.imageUrl.toString(),
      title: message.notification!.title.toString()));
}

addnotificationtodb(notificationModel model) async {
  if (userstate == true) {
    db
        .collection('notifications')
        .doc(user!.uid)
        .collection('notifications')
        .add(model.tojson());
    db
        .collection('notifications')
        .doc(user!.uid)
        .collection('notifications')
        .doc('last')
        .set(model.tojson());
  }
}

forgroundnotifocations() async {
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    if (message.notification != null) {
      addnotificationtodb(notificationModel(
          senttime: DateFormat('yyyy-MM-dd – kk:mm').format(DateTime.now()),
          body: message.notification!.body.toString(),
          image: message.notification!.android!.imageUrl.toString(),
          title: message.notification!.title.toString()));
    }
  });
}

// getprem() async {
//   // ignore: unused_local_variable
//   NotificationSettings settings = await messaging.requestPermission(
//     alert: true,
//     announcement: false,
//     badge: true,
//     carPlay: false,
//     criticalAlert: false,
//     provisional: false,
//     sound: true,
//   );
//   final fcmToken = await FirebaseMessaging.instance.getToken();
//   print(fcmToken);
// }

getuserstate() async {
  await FirebaseAuth.instance.authStateChanges().listen((User? user) {
    if (user != null) {
      widget = home();
      userstate = true;
    } else {
      widget = login();
      userstate = false;
    }
  });
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: F,
      initialBinding: binding(),
      home: onboard != 0 ? const PageOnBorarding() : widget,
    );
  }
}
