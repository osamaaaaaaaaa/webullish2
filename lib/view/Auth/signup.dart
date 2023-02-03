// ignore_for_file: unnecessary_new, unused_local_variable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webullishappnew/view/Auth/privacy.dart';
import 'package:webullishappnew/view/Auth/terms.dart';

import '../../Controller/authController.dart';
import '../../Model/userModel.dart';
import '../Home/countreis.dart';

class register extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return registers();
  }
}

class registers extends State<register> {
  var City = 'select City';
  final email = TextEditingController();
  final password = TextEditingController();
  final name = TextEditingController();
  final mobile = TextEditingController();
  countries country = new countries();
  @override
  Widget build(BuildContext context) {
    String em = 'Email ID..';

    var size = MediaQuery.of(context).size;
    return GetBuilder<authController>(
      init: authController(),
      builder: (controller) => Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Image.asset(
                  'assets/images/webullishlogo.png',
                  width: size.width * 0.5,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  child: TextFormField(
                    style: TextStyle(color: Colors.white),
                    controller: name,
                    decoration: new InputDecoration(
                      prefixIcon: const Icon(
                        Icons.email,
                        color: Colors.white,
                      ),
                      hintText: 'Name..',
                      hintStyle: TextStyle(color: Colors.white),
                      enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        borderSide: BorderSide(
                          color: Colors.grey,
                        ),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  child: TextFormField(
                    controller: email,
                    style: TextStyle(color: Colors.white),
                    decoration: new InputDecoration(
                      prefixIcon: const Icon(
                        Icons.email,
                        color: Colors.white,
                      ),
                      hintText: em,
                      hintStyle: TextStyle(color: Colors.white),
                      enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        borderSide: BorderSide(
                          color: Colors.grey,
                        ),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  child: TextField(
                    obscureText: true,
                    style: TextStyle(color: Colors.white),
                    controller: password,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(
                        Icons.password,
                        color: Colors.white,
                      ),
                      hintText: "Password..",
                      hintStyle: TextStyle(color: Colors.white),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        borderSide: BorderSide(
                          color: Colors.grey,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  child: TextFormField(
                    controller: mobile,
                    style: TextStyle(color: Colors.white),
                    decoration: new InputDecoration(
                      prefixIcon: const Icon(
                        Icons.email,
                        color: Colors.white,
                      ),
                      hintText: 'Mobile..',
                      hintStyle: TextStyle(color: Colors.white),
                      enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        borderSide: BorderSide(
                          color: Colors.grey,
                        ),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 60,
                  padding: EdgeInsets.only(right: 10, left: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  margin: EdgeInsets.all(10),
                  alignment: Alignment.center,
                  child: DropdownButton<String>(
                    isExpanded: true,
                    borderRadius: BorderRadius.circular(20),
                    iconEnabledColor: Colors.white,
                    dropdownColor: Colors.black,
                    icon: Icon(Icons.location_city),
                    value: City,
                    style: TextStyle(color: Colors.white),
                    items: country.countriesList.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(color: Colors.white),
                        ),
                      );
                    }).toList(),
                    onChanged: (data) {
                      setState(() {
                        City = data.toString();
                      });
                    },
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                InkWell(
                  onTap: () {
                    if (email.text.isEmpty ||
                        name.text.isEmpty ||
                        password.text.isEmpty ||
                        mobile.text.isEmpty) {
                      return;
                    }
                    controller.signup(userModel(
                        country: City,
                        email: email.text.trim(),
                        name: name.text,
                        password: password.text,
                        mobile: mobile.text));
                  },
                  child: Container(
                      alignment: Alignment.center,
                      height: 50,
                      width: size.width * 0.7,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.grey),
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(
                            fontSize: 17,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      )),
                ),
                Container(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 25,
                      ),
                      Container(
                          // alignment: Alignment.centerLeft,
                          child: Text(
                        'By clicking Sign Up, you agree to our ',
                        style: TextStyle(color: Colors.white),
                      )),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              Get.to(() => terms());
                            },
                            child: Text(
                              'Terms',
                              style: TextStyle(color: Colors.blue),
                            ),
                          ),
                          Text(
                            ' and ',
                            style: TextStyle(color: Colors.white),
                          ),
                          InkWell(
                            onTap: () {
                              Get.to(() => privacy());
                            },
                            child: Text(
                              'Privacy Policy',
                              style: TextStyle(color: Colors.blue),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
