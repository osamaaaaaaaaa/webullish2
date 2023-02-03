import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webullishappnew/view/Home/home.dart';

import '../../characters/characters.dart';
import '../../notifications/notificationspay.dart';
import '../../performance/performance.dart';

class bottom_nav_bar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        decoration:
            BoxDecoration(border: Border(top: BorderSide(color: Colors.grey))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
                onTap: () {
                  Get.to(() => home());
                },
                child: Image.asset('assets/images/Vector (7).png')),
            InkWell(
                onTap: () {
                  Get.to(() => notificationspay());
                },
                child: Image.asset('assets/images/Vector (8).png')),
            InkWell(
              onTap: () {
                Get.to(() => performance());
              },
              child: Icon(
                Icons.bar_chart_outlined,
                color: Colors.grey,
              ),
            ),
            InkWell(
              onTap: () {
                Get.to(() => CharacterListingScreen());
              },
              child: Icon(
                Icons.info_outline,
                color: Colors.grey,
              ),
            )
          ],
        ));
  }
}
