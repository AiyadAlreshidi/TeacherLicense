import 'package:TeacherLicense/Button.dart';
import 'package:TeacherLicense/Question.dart';
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
            for (int i = 1; i <= NumofTests; i++)
              Button(() {
                Get.to(QuestionsScreen(i));
              }, "اختبار $i"),
          ],
        ),
      ),
    );
  }
}

int get NumofTests {
  int i = 0;
  QFinal.questions.forEach((element) {
    if(element.testNum>i){
      i=element.testNum;
    }


  });


  return i;
}
