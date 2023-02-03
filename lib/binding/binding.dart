import 'package:get/get.dart';

import 'package:webullishappnew/Controller/home.controller.dart';
import 'package:webullishappnew/Controller/notificationController.dart';
import 'package:webullishappnew/Controller/paymentController.dart';
import 'package:webullishappnew/Controller/performanceController.dart';

import '../Controller/authController.dart';

class binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => homeController());
    Get.lazyPut(() => authController());
    Get.lazyPut(() => PaymentController());
    Get.lazyPut(() => performanceController());
    Get.lazyPut(() => notificationController());
  }
}
