import 'package:flutter/material.dart';

TextStyle commonTextStyle(
    double? fontSize, FontWeight? fontWeight, Color? color) {
  return TextStyle(
    fontSize: fontSize ?? 16,
    fontWeight: fontWeight ?? FontWeight.w300,
    color: color ?? Colors.black,
  );
}
