import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Button.dart';
import 'QuizesNumbers.dart';
import 'VediosBuilder.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("رخصة معلم- عام"),
      ),
      body: Column(
        children: [
          SizedBox(
            height: Get.height * 0.1,
          ),
          Image.asset("assets/images/Teacher-1.jpg"),
          SizedBox(
            height: Get.height * 0.05,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Button(() {
                Get.to(QuizesNumber());
              }, "الاختبارات"),
              Button(() {
                Get.to(VedioBuilder());
              }, "الدورات"),
            ],
          )
        ],
      ),
    );
  }
}
