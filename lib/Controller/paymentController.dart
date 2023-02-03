import 'dart:convert';
import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../Model/subscriptionModel.dart';

class PaymentController extends GetxController {
  FirebaseFirestore db = FirebaseFirestore.instance;
  String? ispremuim;
  String? freetria;
  String? token;
  final user = FirebaseAuth.instance.currentUser;
  Map<String, dynamic>? paymentIntentData;

  PaymentController() {
    gettoken();
    getpremcheck();
  }
  gettoken() async {
    final fcmToken = await FirebaseMessaging.instance.getToken();
    token = fcmToken;
    update();
  }

  Future<void> initPaymentSheet(context,
      {required int amount, required String type}) async {
    try {
      // 1. create payment intent on the server
      final response = await http.post(
          Uri.parse(
              'https://us-central1-webullish-14c86.cloudfunctions.net/stripePaymentIntentRequest'),
          body: {
            'email': user!.email,
            'amount': amount.toString(),
          });

      final jsonResponse = jsonDecode(response.body);
      log(jsonResponse.toString());

      //2. initialize the payment sheet
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: jsonResponse['paymentIntent'],
          merchantDisplayName: 'Webullish Subscription',
          customerId: jsonResponse['customer'],
          customerEphemeralKeySecret: jsonResponse['ephemeralKey'],
          style: ThemeMode.light,
          allowsDelayedPaymentMethods: true,
        ),
      );

      await Stripe.instance.presentPaymentSheet();

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Payment completed!')),
      );
      print('object');
      addpremuser(type);
    } catch (e) {
      if (e is StripeException) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error from Stripe: ${e.error.localizedMessage}'),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e')),
        );
      }
    }
  }

  getpremcheck() async {
    await db.collection('subscriptions').doc(user!.uid).get().then((value) {
      ispremuim = value.get('ispremuim');
      freetria = value.get('freetrial');
      update();
    });
    update();
  }

  addpremuser(type) async {
    await db.collection('subscriptions').doc(user!.uid).set(subscriptionsModel(
            date: DateTime.now().toString(),
            freetrial: 'yes',
            ispremum: 'yes',
            token: token.toString(),
            type: type)
        .tojson());
    update();
  }

  getvoucher(doc, context) async {
    db.collection('voucher').doc(doc).get().then((value) async {
      if (value.data() == null) {
        Fluttertoast.showToast(
          msg: "Invaild Voucher",
          toastLength: Toast.LENGTH_SHORT,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.white,
          textColor: Colors.black,
          fontSize: 16.0,
        );
        return;
      } else {
        await initPaymentSheet(context,
            amount: 2000 - int.parse(value.get('amount')), type: 'monthly');
      }
    });
  }
}
