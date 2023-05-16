import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../presentation/controllers/test_controller.dart';

class DetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TestController());
    debugPrint('Hello Binding');
  }
}
