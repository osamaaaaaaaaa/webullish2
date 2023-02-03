import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../Controller/paymentController.dart';

class freetrial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PaymentController>(
        init: PaymentController(),
        builder: (controller) => Scaffold(
                body: Container(
              color: Colors.black,
              child: Center(
                  child: Container(
                      width: 300,
                      height: 220,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.white,
                      ),
                      padding: EdgeInsets.all(20),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Free Trial',
                                style: TextStyle(
                                    color: Colors.amber,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold)),
                            Text('Swing Trading Alerts',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold)),
                            Text('Per 7 days',
                                style: TextStyle(
                                    color: Colors.amber,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold)),
                            Text('0\$',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold)),
                            InkWell(
                              onTap: () {
                                if (controller.freetria == 'yes') {
                                  Fluttertoast.showToast(
                                    msg: "You can use this only one time",
                                    toastLength: Toast.LENGTH_SHORT,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.white,
                                    textColor: Colors.black,
                                    fontSize: 16.0,
                                  );
                                  return;
                                }
                                if (controller.freetria == 'no') {
                                  controller.initPaymentSheet(context,
                                      amount: 50, type: 'freetrial');
                                }
                              },
                              child: Container(
                                padding: EdgeInsets.only(
                                    left: 20, right: 20, top: 10, bottom: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.amber,
                                ),
                                child: Text('Get it Now !'),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                                'Note: It will be withdrawn 0.5\$ to verify validity of Card',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold)),
                          ]))),
            )));
  }
}
