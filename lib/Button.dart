import 'dart:io';

import 'package:auto_direction/auto_direction.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget Button(Function onpress, String text) {
  if (Platform.isIOS) {
    return CupertinoButton(
      padding: EdgeInsets.all(40),
      child: FittedBox(child: AutoDirection(text: "بسب", child: Text(text))),
      onPressed: onpress,
      color: Colors.purple,
    );
  } else {
    return RaisedButton(
      child: FittedBox(child: AutoDirection(text: "يبس", child: Text(text))),
      padding: EdgeInsets.all(40),
      onPressed: onpress,
      color: Colors.purple,
    );
  }
}
