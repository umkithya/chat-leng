import 'package:flutter/material.dart';
import 'package:get/get.dart';

final appColors = Get.put(AppColors());

class AppColors extends GetxController {
  var colorPrimary = const Color(0xFF0070D7).obs;
  static const Color pageBackground = Color(0xFFFAFBFD);
  var colorBackground = const Color(0xFFD8D8D8);
  static const textFieldBackColor = Color(0xfff6f6f6);
  static const Color colorRed = Color(0xFFEB5757);
  static const Color colorLightRed = Color(0xFFFDEDE1);
  static const Color colorGreen = Color(0xFF2FA107);
  static const Color colorLightGreen = Color(0xFFEDF5EE);
  static const Color statusOrange = Color(0xFFFABD22);
  static const Color appTextColor = Color(0xFF000000);
  static const Color appBlue = Color(0xFF01B2EA);
  static const Color colorLightBlue = Color(0xFFEBFAFE);
  static const Color colorTextGrey = Color(0xFF9099A8);
  static const Color colorDevider = Color(0xFFEFEFEF);
  static const Color colorTextBlack = Colors.black;
  static const Color colorUnselect = Color(0xFF9FACBE);
}
