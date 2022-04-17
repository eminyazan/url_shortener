import 'package:flutter/material.dart';

SnackBar customSnackbar(String content, Color backgroundColor) {
  return SnackBar(
    content: Text(content,style: const TextStyle(color: Colors.white),),
    backgroundColor: backgroundColor,
    duration: const Duration(seconds: 3),
    dismissDirection: DismissDirection.horizontal,
  );
}