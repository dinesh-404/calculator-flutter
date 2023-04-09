import 'package:flutter/material.dart';

ButtonStyle myStyle() {
  return ElevatedButton.styleFrom(
      shape: CircleBorder(),
      minimumSize: Size(90, 90),
      backgroundColor: Colors.transparent);
}

TextStyle whiteBtnTxt() {
  return TextStyle(color: Colors.white, fontSize: 30);
}
