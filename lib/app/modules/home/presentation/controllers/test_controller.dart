import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TestController extends GetxController {
  final chatFriendList = [
    "https://media.istockphoto.com/id/1386479313/photo/happy-millennial-afro-american-business-woman-posing-isolated-on-white.jpg?b=1&s=170667a&w=0&k=20&c=ahypUC_KTc95VOsBkzLFZiCQ0VJwewfrSV43BOrLETM=",
    "https://images.pexels.com/photos/415829/pexels-photo-415829.jpeg?auto=compress&cs=tinysrgb&w=1600",
    "https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=1600",
    "https://images.pexels.com/photos/2726111/pexels-photo-2726111.jpeg?auto=compress&cs=tinysrgb&w=1600",
    "https://images.pexels.com/photos/428361/pexels-photo-428361.jpeg?auto=compress&cs=tinysrgb&w=1600",
    "https://images.pexels.com/photos/1040880/pexels-photo-1040880.jpeg?auto=compress&cs=tinysrgb&w=1600"
  ];
  @override
  void dispose() {
    debugPrint('Hello Dispose');
    super.dispose();
  }
}
