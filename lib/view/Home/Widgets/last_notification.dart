import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webullishappnew/Controller/home.controller.dart';

import 'package:webullishappnew/view/notifications/notificationslist.dart';
import 'package:webullishappnew/view/notifications/notificationspay.dart';

class last_notification extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<homeController>(
      init: homeController(),
      builder: (controller) => Column(
        children: [
          Container(
            margin: EdgeInsets.only(left: 15, right: 15),
            alignment: Alignment.centerLeft,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Last alert',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
                InkWell(
                  onTap: () {
                    Get.to(() => notificationspay());
                  },
                  child: Text(
                    'See All',
                    style: TextStyle(
                        color: Color(0xffBF5AF2),
                        fontSize: 15,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ],
            ),
          ),
          controller.lastnotification == null
              ? Text('')
              : Container(
                  alignment: Alignment.center,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color(0xff2C2C2E),
                  ),
                  margin: EdgeInsets.all(8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: controller.lastnotification!.image == null
                            ? Image.network(
                                'https://firebasestorage.googleapis.com/v0/b/webullish-14c86.appspot.com/o/webullishicon.png?alt=media&token=5fa8bd4e-11b4-4959-a0dd-99b009bbb826')
                            : ClipRRect(
                                borderRadius: BorderRadius.circular(40),
                                child: Image.network(
                                  controller.lastnotification!.image,
                                  height: 80,
                                  width: 80,
                                ),
                              ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            controller.lastnotification!.title,
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.45,
                            height: 20,
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Text(
                                controller.lastnotification!.body,
                                style:
                                    TextStyle(fontSize: 15, color: Colors.grey),
                              ),
                            ),
                          ),
                          Text(
                            controller.lastnotification!.senttime,
                            style: TextStyle(
                                fontSize: 13, color: Color(0xffBF5AF2)),
                          ),
                        ],
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.grey,
                      )
                    ],
                  ),
                ),
        ],
      ),
    );
  }
}
