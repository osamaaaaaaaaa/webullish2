import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webullishappnew/Controller/home.controller.dart';
import 'package:webullishappnew/view/Home/Widgets/bottomnav_bar.dart';
import 'package:webullishappnew/view/Home/Widgets/freeacsses.dart';
import 'package:webullishappnew/view/Home/Widgets/last_notification.dart';
import 'package:webullishappnew/view/Home/Widgets/top_alerts.dart';
import 'package:webullishappnew/view/ads.dart';
import 'package:webullishappnew/view/characters/characters.dart';
import 'package:webullishappnew/view/notifications/freetrial.dart';
import 'package:webullishappnew/view/notifications/notificationdetails.dart';

import 'package:webullishappnew/view/notifications/notificationspay.dart';

import '../performance/performance.dart';
import 'Widgets/headbar.dart';

class home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<homeController>(
      init: homeController(),
      builder: (controller) => Scaffold(
        bottomNavigationBar: bottom_nav_bar(),
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
            child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            headbar(name: controller.name),
            const SizedBox(
              height: 20,
            ),
            top_alerts(),
            const SizedBox(
              height: 20,
            ),
            InkWell(
                onTap: () {
                  Get.to(() => notificationdetails(
                        image: controller.lastnotification!.image,
                        body: controller.lastnotification!.body,
                        senttime: controller.lastnotification!.senttime,
                        title: controller.lastnotification!.title,
                      ));
                },
                child: last_notification()),
            const SizedBox(
              height: 20,
            ),
            InkWell(
                onTap: () {
                  Get.to(() => freetrial());
                },
                child: freeacsses()),
            customer_ads()
          ],
        )),
      ),
    );
  }
}
