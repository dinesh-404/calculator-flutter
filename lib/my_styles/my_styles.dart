import 'package:flutter/material.dart';

ButtonStyle tButton() {
  return ElevatedButton.styleFrom(
      shape: CircleBorder(),
      minimumSize: Size(80, 80),
      backgroundColor: Colors.transparent);
}

ButtonStyle diffButton() {
  return ElevatedButton.styleFrom(
      shape: CircleBorder(),
      minimumSize: Size(80, 80),
      backgroundColor: Color.fromRGBO(91, 125, 162, 1));
}

TextStyle whiteBtnTxt() {
  return TextStyle(color: Colors.white, fontSize: 30);
}
