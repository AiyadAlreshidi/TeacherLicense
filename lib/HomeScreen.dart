import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:http/http.dart' as http;
import 'Button.dart';
import 'QuizesNumbers.dart';
import 'Vedios.dart';
import 'VediosBuilder.dart';

class HomeScreen extends StatelessWidget {
  RxBool _loading = false.obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("رخصة معلم- عام"),
      ),
      body: Obx(
            () => ModalProgressHUD(
          inAsyncCall: _loading.value,
          child: Column(
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
                  Button(() async {
                    _loading.value = true;
                    await http
                        .get(
                        "https://teacherexam-94ce9.firebaseio.com/Tests.json")
                        .then((value) {
                      var _loc = json.decoder.convert(value.body);
                      _loading.value = false;
                      Get.to(QuizesNumber(_loc, (_loc[0] as List).length));
                    });
                  }, "الاختبارات"),
                  Button(() async {
                    _loading.value = true;
                    List<Vedios> v = [];
                    await http
                        .get(
                        "https://teacherexam-94ce9.firebaseio.com/Vedios.json")
                        .then((value) {
                      var _loc = json.decoder.convert(value.body);
                      for (int i = 0; i < (_loc as List).length; i++) {
                        v.add(Vedios.fromJson(_loc[i]));
                      }
                      _loading.value = false;
                      Get.to(VedioBuilder(v));
                    });
                  }, "الدورات"),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
