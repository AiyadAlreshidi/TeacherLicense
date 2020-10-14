import 'package:TeacherLicense/PlsStudeHard.dart';
import 'package:arabic_numbers/arabic_numbers.dart';
import 'package:auto_direction/auto_direction.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import 'Button.dart';
import 'Tests.dart';

class QuestionsScreen extends StatelessWidget {
  RxInt _degrees = 0.obs;
  int testNumber;
  var Localjson;
  QuestionsScreen(this.testNumber, this.Localjson);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("الاختبارات"),
      ),
      body: Column(
        children: [
          QuizWedgit(<Tests>[
            for (int i = 0; i < (Localjson[testNumber] as List).length; i++)
              Tests.fromJson(Localjson[testNumber][i]),
          ], _degrees),
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
  List<Tests> q;
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
      a = widget.q[index].SuffleIt(widget.q[index]);
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
            "${ArabicNumbers().convert(index + 1)}- ${widget.q[index].s0}",
            style: TextStyle(
                color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 25),
            textAlign: TextAlign.center,
          ),
        ),
        if (GetUtils.isURL(widget.q[index].image))
          Image.network(
            widget.q[index].image,
            height: Get.height * 0.2,
          ),
        AutoDirection(
            text: "عربي",
            child: Text(
              "${ArabicNumbers().convert(widget.q.length - index - 1)} سؤال متبقي ",
              textAlign: TextAlign.left,
              style: TextStyle(color: Colors.red, fontSize: 17),
            )),
        ...a
            .map((e) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: Get.width,
                    child: FlatButton(
                      textColor: Colors.white,
                      color: e == widget.q[index].s1 && _isanswerd
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
                        if (e == widget.q[index].s1 && !_isanswerd) {
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
                if (_isanswerd == false) {
                  answerdwrong.add(index);
                }
                setState(() {
                  index++;
                  _isanswerd = false;
                  isFirst = true;
                });
              }, "السؤال التالي")
            : FlatButton(
                onPressed: () {
                  if (_isanswerd == false) {
                    answerdwrong.add(index);
                  }
                  Get.dialog(AlertDialog(
                    title: AutoDirection(
                        text: "عربي",
                        child: Column(
                          children: [
                            Text(
                              "لقد حصلت علي ${widget.deg} درجات من ${widget.q.length}",
                              textAlign: TextAlign.center,
                            ),
                            answerdwrong.isNotEmpty
                                ? FlatButton(
                                    onPressed: () {
                                      List<Tests> errors = [];
                                      answerdwrong.forEach((element) {
                                        errors.add(widget.q[element]);
                                      });
                                      Get.to(PlsStudeHard(
                                          errors.toSet().toList()));
                                    },
                                    child: Text(
                                      "معرفة الاخطاء والاستذكار",
                                      style: TextStyle(
                                          color: Colors.blue, fontSize: 16),
                                    ))
                                : SizedBox(),
                          ],
                        )),
                  ));
                },
                child: Text(
                  "عرض التقرير",
                  style: TextStyle(color: Colors.red, fontSize: 24),
                )),
        SizedBox(
          height: 20,
        )
      ],
    );
  }
}
