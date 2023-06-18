import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key, required this.ok}) : super(key: key);
  final String ok;
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: DetailCon.paraM(ok),
      builder:(controller)=> Scaffold(
        appBar: AppBar(
          title: const Text('Detail'),
        ),
        body: const Column(
          children: [],
        ),
      ),
    );
  }
}

class DetailCon extends GetxController {
  DetailCon();
  String? ok;
  DetailCon.paraM(this.ok);
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    debugPrint('ok:$ok');
  }
}
