import 'package:flutter/material.dart';
import 'package:flutter_paypal/flutter_paypal.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:get/get.dart';
import 'package:webullishappnew/view/Home/Widgets/bottomnav_bar.dart';

import '../../Controller/paymentController.dart';
import 'notificationslist.dart';

class notificationspay extends StatelessWidget {
  var code = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PaymentController>(
        init: PaymentController(),
        builder: (controller) => Scaffold(
            bottomNavigationBar: bottom_nav_bar(),
            backgroundColor: Colors.black,
            body: controller.ispremuim != 'yes'
                ? SingleChildScrollView(
                    child: Container(
                      //                height: MediaQuery.of(context).size.height,

                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              height: 50,
                            ),
                            Container(
                                alignment: Alignment.center,
                                child: Text('Get the golden plans',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold))),
                            SizedBox(
                              height: 50,
                            ),
                            Container(
                                padding: EdgeInsets.only(left: 20),
                                alignment: Alignment.topLeft,
                                child: Text('Have a voucher ?',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold))),
                            Stack(children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(top: 10),
                                    width: MediaQuery.of(context).size.width *
                                        0.75,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(30),
                                            bottomLeft: Radius.circular(30)),
                                        color: Colors.white),
                                    child: TextField(
                                      controller: code,
                                      decoration: InputDecoration(
                                          hintStyle:
                                              TextStyle(color: Colors.grey),
                                          border: OutlineInputBorder(
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(30),
                                                  bottomLeft:
                                                      Radius.circular(30))),
                                          hintText: '#Discount Code'),
                                    ),
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.2,
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(top: 10),
                                    width: MediaQuery.of(context).size.width *
                                        0.68,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 11),
                                    child: Container(
                                      alignment: Alignment.center,
                                      child: InkWell(
                                        onTap: () {
                                          if (code.text.isEmpty) {
                                            return;
                                          }
                                          controller.getvoucher(
                                              code.text, context);
                                        },
                                        child: Text(
                                          ' activate',
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 48, 62, 72),
                                              fontSize: 17),
                                        ),
                                      ),
                                      height: 59,
                                      width: MediaQuery.of(context).size.width *
                                          0.27,
                                      decoration: BoxDecoration(
                                        color: Colors.amber,
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ]),
                            SizedBox(
                              height: 50,
                            ),
                            Container(
                              width: 350,
                              //height: 220,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.blueGrey, blurRadius: 30)
                                ],
                                borderRadius: BorderRadius.circular(25),
                                color: Colors.white,
                              ),
                              padding: EdgeInsets.all(20),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Monthly',
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold)),
                                  Text('Swing Trading Alerts',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold)),
                                  Text('per 1 month',
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w300)),
                                  Text('20\$',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold)),
                                  Text(
                                      '''* Well Researched Stock Alerts
* Simple Format For All Stock Traders
* 100+ Spot-On Stock Alerts Every Month
* Accessible Analytics
* Trackable Performance
* \$20/Month''',
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w300)),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Column(
                                    children: [
                                      InkWell(
                                        onTap: () async {
                                          await controller.initPaymentSheet(
                                              context,
                                              amount: 2000,
                                              type: 'monthly');
                                        },
                                        child: Container(
                                          padding: EdgeInsets.only(
                                              left: 20,
                                              right: 20,
                                              top: 10,
                                              bottom: 10),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: Colors.amber.shade200,
                                          ),
                                          child: Text('credit/debit card'),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Get.to(UsePaypal(
                                              sandboxMode: false,
                                              clientId:
                                                  "AYNIZyJHoQbOCvaMBcz0dpujURWL0GOKi2PjCenYLUC4e_LAjyU4ut-N_kA15VdqKqJGNIvubvCpViEi",
                                              secretKey:
                                                  "EI-9pdBzS-Rjl-ooPbRzhFgtS30dYsGvnole6aJ6YyRXhPkAoIy8bWXsljGTB61yzRil18KS4xVsKgko",
                                              returnURL:
                                                  "https://samplesite.com/return",
                                              cancelURL:
                                                  "https://samplesite.com/cancel",
                                              transactions: const [
                                                {
                                                  "amount": {
                                                    "total": '20.00',
                                                    "currency": "USD",
                                                    "details": {
                                                      "subtotal": '20.00',
                                                      "shipping": '0',
                                                      "shipping_discount": 0
                                                    }
                                                  },
                                                  "description":
                                                      "The payment transaction description.",
                                                  // "payment_options": {
                                                  //   "allowed_payment_method":
                                                  //       "INSTANT_FUNDING_SOURCE"
                                                  // },
                                                  "item_list": {
                                                    "items": [
                                                      {
                                                        "name":
                                                            "A demo product",
                                                        "quantity": 1,
                                                        "price": '20.00',
                                                        "currency": "USD"
                                                      }
                                                    ],

                                                    // shipping address is not required though
                                                    "shipping_address": {
                                                      "recipient_name":
                                                          "webullish",
                                                      "line1":
                                                          "united states - Irbid",
                                                      "line2": "",
                                                      "city": "Irbid",
                                                      "country_code": "JO",
                                                      "postal_code": "21121",
                                                      "phone": "+962791560467",
                                                    },
                                                  }
                                                }
                                              ],
                                              note:
                                                  "Contact us for any questions on your order.",
                                              onSuccess: (Map params) async {
                                                // controller.addpremuimuser('monthly');

                                                print("onSuccess: $params");
                                              },
                                              onError: (error) {
                                                Fluttertoast.showToast(
                                                  msg:
                                                      "error,please try again later",
                                                  toastLength:
                                                      Toast.LENGTH_SHORT,
                                                  timeInSecForIosWeb: 1,
                                                  backgroundColor: Colors.grey,
                                                  textColor: Colors.white,
                                                  fontSize: 16.0,
                                                );

                                                print("onError: $error");
                                              },
                                              onCancel: (params) {
                                                print('cancelled: $params');
                                              }));
                                        },
                                        child: Container(
                                          padding: EdgeInsets.only(
                                              left: 20,
                                              right: 20,
                                              top: 10,
                                              bottom: 10),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: Colors.amber,
                                          ),
                                          child: Text('Pay with paypal'),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 50,
                            ),
                            Container(
                              width: 350,
                              //      height: 240,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.blueGrey, blurRadius: 30)
                                ],
                              ),
                              padding: EdgeInsets.all(20),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('ANNUALLY',
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold)),
                                  Text(
                                      'Save Huge By Making One Single Annual Payment',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold)),
                                  Text('per 12 month',
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w300)),
                                  Text('140\$',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold)),
                                  Text(
                                      '''* 40% Less Than The Monthly Rate
* \$140/ Year
* No Contracts.No Commitments
* Cancel Anytime
* A Quick Refund For The Unused Portion ''',
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w300)),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Column(
                                    children: [
                                      InkWell(
                                        onTap: () async {
                                          await controller.initPaymentSheet(
                                              context,
                                              amount: 14000,
                                              type: 'yearly');
                                        },
                                        child: Container(
                                          padding: EdgeInsets.only(
                                              left: 20,
                                              right: 20,
                                              top: 10,
                                              bottom: 10),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: Colors.amber.shade200,
                                          ),
                                          child: Text('credit/debit card'),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Get.to(UsePaypal(
                                              sandboxMode: false,
                                              clientId:
                                                  "AYNIZyJHoQbOCvaMBcz0dpujURWL0GOKi2PjCenYLUC4e_LAjyU4ut-N_kA15VdqKqJGNIvubvCpViEi",
                                              secretKey:
                                                  "EI-9pdBzS-Rjl-ooPbRzhFgtS30dYsGvnole6aJ6YyRXhPkAoIy8bWXsljGTB61yzRil18KS4xVsKgko",
                                              returnURL:
                                                  "https://samplesite.com/return",
                                              cancelURL:
                                                  "https://samplesite.com/cancel",
                                              transactions: const [
                                                {
                                                  "amount": {
                                                    "total": '140.00',
                                                    "currency": "USD",
                                                    "details": {
                                                      "subtotal": '140.00',
                                                      "shipping": '0',
                                                      "shipping_discount": 0
                                                    }
                                                  },
                                                  "description":
                                                      "The payment transaction description.",
                                                  // "payment_options": {
                                                  //   "allowed_payment_method":
                                                  //       "INSTANT_FUNDING_SOURCE"
                                                  // },
                                                  "item_list": {
                                                    "items": [
                                                      {
                                                        "name":
                                                            "A demo product",
                                                        "quantity": 1,
                                                        "price": '140.00',
                                                        "currency": "USD"
                                                      }
                                                    ],

                                                    // shipping address is not required though
                                                    "shipping_address": {
                                                      "recipient_name":
                                                          "webullish",
                                                      "line1":
                                                          "united states - Irbid",
                                                      "line2": "",
                                                      "city": "Irbid",
                                                      "country_code": "JO",
                                                      "postal_code": "21121",
                                                      "phone": "+962791560467",
                                                    },
                                                  }
                                                }
                                              ],
                                              note:
                                                  "Contact us for any questions on your order.",
                                              onSuccess: (Map params) async {
                                                // controller.addpremuimuser('monthly');

                                                print("onSuccess: $params");
                                              },
                                              onError: (error) {
                                                Fluttertoast.showToast(
                                                  msg:
                                                      "error,please try again later",
                                                  toastLength:
                                                      Toast.LENGTH_SHORT,
                                                  timeInSecForIosWeb: 1,
                                                  backgroundColor: Colors.grey,
                                                  textColor: Colors.white,
                                                  fontSize: 16.0,
                                                );

                                                print("onError: $error");
                                              },
                                              onCancel: (params) {
                                                print('cancelled: $params');
                                              }));
                                        },
                                        child: Container(
                                          padding: EdgeInsets.only(
                                              left: 20,
                                              right: 20,
                                              top: 10,
                                              bottom: 10),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: Colors.amber,
                                          ),
                                          child: Text('Pay with paypal'),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 50,
                            ),
                          ]),
                    ),
                  )
                : notificationslist()));
  }
}
