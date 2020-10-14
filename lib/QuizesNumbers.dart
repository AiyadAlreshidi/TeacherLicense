import 'package:TeacherLicense/Button.dart';
import 'package:TeacherLicense/QuestionsScreen.dart';
import 'package:TeacherLicense/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuizesNumber extends StatelessWidget {
  var LocaljSON;
  int numOfTests;
  QuizesNumber(this.LocaljSON,this.numOfTests);
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
            for (int i = 1; i <= numOfTests; i++)
              Button(() {
                Get.to(QuestionsScreen(i-1,LocaljSON));
              }, "اختبار $i"),
          ],
        ),
      ),
    );
  }
}
