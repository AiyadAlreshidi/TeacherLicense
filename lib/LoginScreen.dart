import 'dart:convert';

import 'package:TeacherLicense/Button.dart';
import 'package:auto_direction/auto_direction.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'HomeScreen.dart';
import 'package:url_launcher/url_launcher.dart' as url;

class LoginScreen extends StatelessWidget {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  RxBool _isloading = false.obs;
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (BuildContext context) {
        return Form(
          key: _globalKey,
          child: Scaffold(
              appBar: AppBar(
                title: Text("رخصة معلم- عام"),
              ),
              body: Obx(
                () => ModalProgressHUD(
                  inAsyncCall: _isloading.value,
                  child: ListView(
                    children: [
                      Image.asset("assets/images/Teacher-1.jpg"),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: "ادخل الكود الخاص بك",
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(color: Colors.white)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(color: Colors.white)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(color: Colors.white)),
                        ),
                        validator: (value) {
                          if (value.isEmpty ||
                              value.trimRight().trimLeft() == '') {
                            return "لا ينبغي ان يكون هذا الحقل فارغا";
                          }
                        },
                        onSaved: (code) async {
                          _isloading.value = true;
                          await http
                              .get(
                                  "https://teacherexam-94ce9.firebaseio.com/codes.json")
                              .then((value) {
                            Map aa = json.decoder.convert(value.body);
                            String todel;
                            aa.forEach((key, value) {
                              if (value.toString().contains(
                                  "${code.trimRight().trimRight()}")) {
                                todel = key;
                              }
                            });
                            if (todel != null) {
                              http.delete(
                                  "https://teacherexam-94ce9.firebaseio.com/codes/$todel.json");
                              GetStorage().write("logged", true);
                              _isloading.value = false;
                              Get.offAll(HomeScreen());
                            } else {
                              _isloading.value = false;
                              Get.showSnackbar(GetBar(
                                message:
                                "كود غير صحيح يرجي التواصل معنا",
                              ));

                              // Get.dialog(AlertDialog(
                              //   title: Text(),
                              // ));
                              // Get.showSnackbar(GetBar(
                              //   message: "انت لست مسجل",title: "dsfsdfsd",
                              // ));
                            }
                          });
                        },
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: Get.width * 0.2),
                        child: Button(() {
                          if (_globalKey.currentState.validate()) {
                            _globalKey.currentState.save();
                          }
                        }, "الدخول"),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      GestureDetector(
                        onTap: () {
                          url.launch("tel:+966503998452");
                        },
                        child: AutoDirection(
                          text: "uie",
                          child: Text(
                            """+966503998452   للاشتراك والاستعلام""",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )),
        );
      },
    );
  }
}
