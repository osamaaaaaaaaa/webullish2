import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:webullishappnew/Controller/notificationController.dart';

import 'notificationdetails.dart';

class notificationslist extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<notificationController>(
      init: notificationController(),
      builder: (controller) => Scaffold(
        backgroundColor: Colors.black,
        body: controller.notificationlist.isEmpty
            ? const Center(
                child: Text(
                  'No Notifications',
                  style: TextStyle(color: Colors.white),
                ),
              )
            // ignore: sized_box_for_whitespace
            : Column(
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Color(0xff2C2C2E),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Icon(
                              Icons.arrow_back_ios,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Text(
                        'Today\'s  Alert',
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                  Container(
                      padding: EdgeInsets.only(bottom: 20, top: 15),
                      height: MediaQuery.of(context).size.height - 100,
                      child: ListView.builder(
                        itemCount: controller.notificationlist.length,
                        itemBuilder: (context, index) => InkWell(
                          onTap: () {
                            Get.to(() => notificationdetails(
                                  image:
                                      controller.notificationlist[index].image,
                                  body: controller.notificationlist[index].body,
                                  senttime: controller
                                      .notificationlist[index].senttime,
                                  title:
                                      controller.notificationlist[index].title,
                                ));
                          },
                          child: Container(
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
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(40),
                                    child: Image.network(
                                      controller.notificationlist[index].image,
                                      height: 80,
                                      width: 80,
                                    ),
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      controller.notificationlist[index].title,
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.45,
                                      height: 20,
                                      child: SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Text(
                                          controller
                                              .notificationlist[index].body,
                                          style: TextStyle(
                                              fontSize: 15, color: Colors.grey),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      controller
                                          .notificationlist[index].senttime,
                                      style: TextStyle(
                                          fontSize: 13,
                                          color: Color(0xffBF5AF2)),
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
                        ),
                      )),
                ],
              ),
      ),
    );
  }
}
