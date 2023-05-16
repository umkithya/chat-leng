import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TestController extends GetxController {
  final detail = "Hello Detail";
  @override
  void dispose() {
    debugPrint('Hello Dispose TestController');
    super.dispose();
  }

  @override
  void onClose() {
    debugPrint('Close');
    super.onClose();
  }

  @override
  void onReady() {
    debugPrint('onReady');
    super.onReady();
  }
}
