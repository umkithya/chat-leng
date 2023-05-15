import 'package:chat_leng/app/modules/home/presentation/controllers/test_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../presentation/controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(()=>HomeController());
    Get.lazyPut(()=>TestController());
    debugPrint('Hello Binding');
  }
}
