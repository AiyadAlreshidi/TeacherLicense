import 'package:TeacherLicense/Question.dart';
import 'package:TeacherLicense/Vedios.dart';
import 'package:TeacherLicense/VediosBuilder.dart';
import 'package:arabic_numbers/arabic_numbers.dart';
import 'package:auto_direction/auto_direction.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import 'Button.dart';

class QuestionsScreen extends StatelessWidget {
  RxInt _degrees = 0.obs;

  int testNumber;
  QuestionsScreen(this.testNumber);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("الاختبارات"),
      ),
      body: Column(
        children: [
          QuizWedgit(
              QFinal.questions
                  .where((element) => element.testNum == testNumber)
                  .toList(),
              _degrees),
          Obx(() => AutoDirection(
              text: 'عربي',
              child: Text(
                " درجتك هي  ${_degrees.value}",
                style: TextStyle(fontSize: 19),
              )))
        ],
      ),
    );
  }
}

class QuizWedgit extends StatefulWidget {
  QuizWedgit(this.q, this.deg);
  List<Question> q;
  RxInt deg;
  @override
  _QuizWedgitState createState() => _QuizWedgitState();
}

class _QuizWedgitState extends State<QuizWedgit> {
  int index = 0;
  bool _isanswerd = false;
  List<String> a;
  List<int> answerdwrong = [];

  bool isFirst = true;
  @override
  Widget build(BuildContext context) {
    if (isFirst) {
      a = widget.q[index].getSuffiledanswers;
      isFirst = false;
    }
    print(index);
    print(widget.q.length);
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AutoDirection(
          text: "يسب",
          child: Text(
            "${ArabicNumbers().convert(index + 1)}- ${widget.q[index].question}",
            style: TextStyle(
                color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 25),
            textAlign: TextAlign.center,
          ),
        ),
        AutoDirection(
            text: "عربي",
            child: Text(
              "${ArabicNumbers().convert(QFinal.questions.length - index - 1)}سؤال متبقي ",
              textAlign: TextAlign.left,
              style: TextStyle(color: Colors.red, fontSize: 15),
            )),
        ...a
            .map((e) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: Get.width,
                    child: FlatButton(
                      textColor: Colors.white,
                      color: e == widget.q[index].answers[0] && _isanswerd
                          ? Colors.green
                          : Colors.orange,
                      child: Text(
                        e,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                        ),
                      ),
                      onPressed: () {
                        if (e == widget.q[index].answers[0] && !_isanswerd) {
                          print('true');
                          widget.deg.value++;
                        } else {
                          answerdwrong.add(index);
                          print('false');
                        }
                        setState(() {
                          _isanswerd = true;
                        });
                      },
                    ),
                  ),
                ))
            .toList(),
        (index < widget.q.length - 1)
            ? Button(() {
                setState(() {
                  index++;
                  _isanswerd = false;
                  isFirst = true;
                });
              }, "السؤال التالي")
            : FlatButton(
                onPressed: () {
                  Get.dialog(AlertDialog(
                    title: AutoDirection(
                        text: "عربي",
                        child: Column(
                          children: [
                            Text(
                              "لقد حصلت علي ${widget.deg} درجات من ${widget.q.length}",
                              textAlign: TextAlign.center,
                            ),
                            FlatButton(
                                onPressed: () {
                                  List<Question> errors = [];
                                  answerdwrong.forEach((element) {
                                    errors.add(QFinal.questions[element]);
                                  });
                                  Get.to(FalseResults(errors));
                                },
                                child: Text(
                                  "معرفة الاخطاء والاستذكار",
                                  style: TextStyle(
                                      color: Colors.blue, fontSize: 16),
                                )),
                          ],
                        )),
                  ));
                },
                child: Text("عرض التقرير",style: TextStyle(color: Colors.red,fontSize: 24
                ),)),
        SizedBox(height: 20,)
      ],
    );
  }
}

class FalseResults extends StatelessWidget {
  List<Question> errors;
  FalseResults(this.errors);
  @override
  Widget build(BuildContext context) {
    print(errors.length);
    return Scaffold(
      appBar: AppBar(
        title: Text("تعلم من اخطاءك وراجع مره اخري"),
      ),
      body: AutoDirection(
        text: "يسب",
        child: ListView(
          children: errors
              .map((e) => ListTile(
                    trailing: IconButton(
                      icon: Icon(Icons.video_collection_outlined),
                      onPressed: () {
                        Get.to(ViewVedio(Vedios(0, e.explain, e.question)));
                      },
                    ),
                    title: Text(
                      e.question,
                      style: TextStyle(fontSize: 17),
                    ),
                    subtitle: Text(
                      e.answers[0],
                      style: TextStyle(fontSize: 17, color: Colors.green),
                    ),
                  ))
              .toList(),
        ),
      ),
    );
  }
}
