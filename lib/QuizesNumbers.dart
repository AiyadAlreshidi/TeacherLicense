import 'package:TeacherLicense/Button.dart';
import 'package:TeacherLicense/QuestionsScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuizesNumber extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("الاختبارات"),
      ),
      body: Padding(
        padding: EdgeInsets.all(25),
        child: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: Get.height * 0.03,
              crossAxisSpacing: Get.width * 0.1),
          children: [
            Button(() {
              Get.to(QuestionsScreen(1));
            }, "اختبار ١"),
            Button(() {
              Get.to(QuestionsScreen(2));
            }, "اختبار ٢"),
            Button(() {
              Get.to(QuestionsScreen(3));
            }, "اختبار ٣"),
            Button(() {
              Get.to(QuestionsScreen(4));
            }, "اختبار ٤"),
            Button(() {
              Get.to(QuestionsScreen(5));
            }, "اختبار ٥"),
            Button(() {
              Get.to(QuestionsScreen(6));
            }, "اختبار ٦"),
            Button(() {
              Get.to(QuestionsScreen(7));
            }, "اختبار ٧"),
            Button(() {
              Get.to(QuestionsScreen(8));
            }, "اختبار ٨"),
          ],
        ),
      ),
    );
  }
}
