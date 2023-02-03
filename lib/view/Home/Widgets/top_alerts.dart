import 'package:dots_indicator/dots_indicator.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webullishappnew/Controller/home.controller.dart';

class top_alerts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<homeController>(
        init: homeController(),
        builder: (controller) => Container(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      left: 15,
                    ),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Today\'s Top Alert',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10, right: 10),
                    height: 250,
                    child: PageView.builder(
                      onPageChanged: ((value) {
                        controller.updatedot(value.toDouble());
                      }),
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.top_alert_list.length,
                      itemBuilder: (context, index) => Container(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(35),
                          child: Image.network(
                            height: 220,
                            controller.top_alert_list[index].toString(),
                          ),
                        ),
                      ),
                    ),
                  ),
                  new DotsIndicator(
                    dotsCount: controller.top_alert_list.isEmpty
                        ? 1
                        : controller.top_alert_list.length,
                    position: controller.dot,
                    decorator: DotsDecorator(
                      color: Colors.white, // Inactive color
                      activeColor: Color(0xffBF5AF2),
                    ),
                  ),
                ],
              ),
            ));
  }
}
