import 'package:TeacherLicense/Button.dart';
import 'package:TeacherLicense/HomeScreen.dart';
import 'package:TeacherLicense/Tests.dart';
import 'package:TeacherLicense/VediosBuilder.dart';
import 'package:auto_direction/auto_direction.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Vedios.dart';

class PlsStudeHard extends StatelessWidget {
  List<Tests> errors;
  PlsStudeHard(this.errors);
  @override
  Widget build(BuildContext context) {
    print(errors.length);
    return Scaffold(
      appBar: AppBar(
        title: Text("تعلم من اخطاءك وراجع مره اخري"),
      ),
      body: AutoDirection(
        text: "يسب",
        child: ListView(children: [
          ...errors
              .map((e) => ListTile(
                    trailing: IconButton(
                      icon: Icon(Icons.video_collection_outlined),
                      onPressed: () {
                        Get.to(ViewVedio(Vedios(e.explain, e.s0)));
                      },
                    ),
                    title: Text(
                      e.s0,
                      style: TextStyle(fontSize: 17),
                    ),
                    subtitle: Text(
                      e.s1,
                      style: TextStyle(fontSize: 17, color: Colors.green),
                    ),
                  ))
              .toList(),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: Get.width*0.2,vertical: 10),
            child: Button(() {
              Get.offAll(HomeScreen());
            }, "ارجع الي الصفحه الرئيسية"),
          )
        ]),
      ),
    );
  }
}
