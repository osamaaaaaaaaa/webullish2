import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:webullishappnew/view/deletaccount.dart';

import '../../Auth/login.dart';

class headbar extends StatelessWidget {
  late String name;
  headbar({required this.name});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Text(
                    'Hello ',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 27,
                        fontWeight: FontWeight.w300),
                  ),
                  Text(
                    '$name,',
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 27,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  DateTime.now().hour < 12 ? 'Good Morning' : 'Good Afternoon',
                  style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
          InkWell(
            onTap: () {
              showMaterialModalBottomSheet(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                  ),
                  enableDrag: true,
                  context: context,
                  builder: (context) => Container(
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: new BorderRadius.only(
                              topLeft: const Radius.circular(30.0),
                              topRight: const Radius.circular(30.0))),
                      child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          controller: ModalScrollController.of(context),
                          child: Column(
                            children: [
                              InkWell(
                                onTap: () async {
                                  await FirebaseAuth.instance.signOut();

                                  Get.to(login());
                                },
                                child: Container(
                                  margin: EdgeInsets.all(20),
                                  alignment: Alignment.center,
                                  height: 50,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(30)),
                                  child: Text(
                                    'Sign out',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () async {
                                  Get.back();
                                  Get.to(deleteacc());
                                },
                                child: Container(
                                  margin: EdgeInsets.all(20),
                                  alignment: Alignment.center,
                                  height: 50,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(30)),
                                  child: Text(
                                    'Delete Account',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ],
                          ))));
            },
            child: Icon(
              Icons.settings,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
