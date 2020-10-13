import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget Button(Function onpress, String text) {
  if (Platform.isIOS) {
    return CupertinoButton(
      padding: EdgeInsets.all(40),
      child: FittedBox(child: Text(text)),
      onPressed: onpress,
      color: Colors.purple,
    );
  } else {
    return RaisedButton(
      child: FittedBox(child: Text(text)),
      padding: EdgeInsets.all(40),
      onPressed: onpress,
      color: Colors.purple,
    );
  }
}
