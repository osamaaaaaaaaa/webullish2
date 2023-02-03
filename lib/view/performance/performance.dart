import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webullishappnew/view/Home/Widgets/bottomnav_bar.dart';
import 'package:webullishappnew/view/performance/performance_details.dart';

import '../../Controller/performanceController.dart';

class performance extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<performanceController>(
        init: performanceController(),
        builder: (controller) => Scaffold(
              bottomNavigationBar: bottom_nav_bar(),
              backgroundColor: Colors.black,
              body: SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.all(7),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 50,
                      ),
                      Text(
                        'Monthly Performance',
                        style: TextStyle(
                            color: Color(0xffBF5AF2),
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                      Container(
                        margin: EdgeInsets.all(15),
                        child: Text(
                          'We have made it easier than ever to access our many invaluable reports! Check them all out here, broken down into monthly categories.',
                          style: TextStyle(fontSize: 15, color: Colors.grey),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          controller.getperformance('jan');
                          Get.to(() => performancedetails());
                        },
                        child: _widget(
                          'January',
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          controller.getperformance('feb');
                          Get.to(() => performancedetails());
                        },
                        child: _widget(
                          'February',
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          controller.getperformance('mar');
                          Get.to(() => performancedetails());
                        },
                        child: _widget(
                          'March',
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          controller.getperformance('apr');
                          Get.to(() => performancedetails());
                        },
                        child: _widget(
                          'April',
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          controller.getperformance('may');
                          Get.to(() => performancedetails());
                        },
                        child: _widget(
                          'May',
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          controller.getperformance('jun');
                          Get.to(() => performancedetails());
                        },
                        child: _widget(
                          'June',
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          controller.getperformance('jul');
                          Get.to(() => performancedetails());
                        },
                        child: _widget(
                          'July',
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          controller.getperformance('aug');
                          Get.to(() => performancedetails());
                        },
                        child: _widget(
                          'August',
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          controller.getperformance('sep');
                          Get.to(() => performancedetails());
                        },
                        child: _widget(
                          'September',
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          controller.getperformance('oct');
                          Get.to(() => performancedetails());
                        },
                        child: _widget(
                          'October',
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          controller.getperformance('nov');
                          Get.to(() => performancedetails());
                        },
                        child: _widget(
                          'November',
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          controller.getperformance('dec');
                          Get.to(() => performancedetails());
                        },
                        child: _widget(
                          'December',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ));
  }
}

Widget _widget(title) => Center(
      child: Container(
        margin: const EdgeInsets.all(15),
        alignment: Alignment.center,
        height: 250,
        width: Get.width,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(color: Colors.white.withOpacity(0.5), blurRadius: 20)
        ], borderRadius: BorderRadius.circular(15), color: Colors.black),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                  color: Color(0xffBF5AF2),
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              'Performance ${title[0]}${title[1]}${title[2]}',
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Text(
                'Here you will find all of our analyzes for this month',
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Color.fromARGB(165, 158, 158, 158),
              ),
              child: Text(
                'SEE RESULTS',
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
