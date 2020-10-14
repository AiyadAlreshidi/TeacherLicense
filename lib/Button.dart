import 'dart:io';
import 'dart:ui';

import 'package:auto_direction/auto_direction.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  Button(this.onpress, this.text);
  Function onpress;
  String text;
  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
            padding: EdgeInsets.all(40),
            child:
                AutoDirection(text: "بسب", child: Text(text)),
            onPressed: onpress,
            color: Colors.purple,
          );
  }
}
//
//
// Widget Button(, ) {
//   if (!Platform.isIOS) {
//     return;
//   } else {
//     return ;
//   }
// }
