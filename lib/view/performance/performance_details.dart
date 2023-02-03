import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webullishappnew/Controller/performanceController.dart';

class performancedetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<performanceController>(
      init: performanceController(),
      builder: (controller) => Scaffold(
        backgroundColor: Colors.black,
        body: Container(
            child: Column(
          children: [
            SizedBox(
              height: 80,
            ),
            _widget(context, 'Symbol', 'P&L Target', 'P&L Reached',
                ' Additional\n Comments'),
            SizedBox(
              height: 10,
            ),
            Container(
              height: MediaQuery.of(context).size.height - 350,
              child: ListView.builder(
                  itemCount: controller.performancelist.length,
                  itemBuilder: (context, index) =>
                      controller.performancelist.isEmpty
                          ? Text('')
                          : _widget2(
                              context,
                              controller.performancelist[index].symbol,
                              controller.performancelist[index].pltarget,
                              controller.performancelist[index].plreached,
                              controller.performancelist[index].comment,
                            )),
            )
          ],
        )),
      ),
    );
  }
}

Widget _widget(context, title1, title2, title3, title4) => Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(color: Colors.white.withOpacity(0.5), blurRadius: 20)
      ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 50,
            width: MediaQuery.of(context).size.width * 0.21,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Color(0xff2C2C2E),
                borderRadius: BorderRadius.circular(7),
                border: Border.all(color: Colors.white)),
            child: Text(
              title1,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            height: 50,
            width: MediaQuery.of(context).size.width * 0.23,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Color(0xff2C2C2E),
                borderRadius: BorderRadius.circular(7),
                border: Border.all(color: Colors.white)),
            child: Text(
              title2,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            height: 50,
            width: MediaQuery.of(context).size.width * 0.24,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Color(0xff2C2C2E),
                borderRadius: BorderRadius.circular(7),
                border: Border.all(color: Colors.white)),
            child: Text(
              title3,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            height: 50,
            width: MediaQuery.of(context).size.width * 0.30,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Color(0xff2C2C2E),
                borderRadius: BorderRadius.circular(7),
                border: Border.all(color: Colors.white)),
            child: Text(
              title4,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );

Widget _widget2(context, title1, title2, title3, title4) => Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 50,
            width: MediaQuery.of(context).size.width * 0.21,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(7),
                border: Border.all(color: Colors.black)),
            child: Text(
              title1,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            height: 50,
            width: MediaQuery.of(context).size.width * 0.23,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(7),
                border: Border.all(color: Colors.black)),
            child: Text(
              title2,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            height: 50,
            width: MediaQuery.of(context).size.width * 0.24,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(7),
                border: Border.all(color: Colors.black)),
            child: Text(
              title3,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            height: 50,
            width: MediaQuery.of(context).size.width * 0.30,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(7),
                border: Border.all(color: Colors.black)),
            child: Text(
              title4,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w400),
            ),
          ),
        ],
      ),
    );
