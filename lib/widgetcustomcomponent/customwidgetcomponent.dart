import 'package:flutter/material.dart';

Widget customtext(String text, [Color? clr, double? siz, FontWeight? fontwt]) {
  return Text(text,
      style: TextStyle(
        color: clr,
        fontSize: siz,
        fontWeight: fontwt,
      ));
}
