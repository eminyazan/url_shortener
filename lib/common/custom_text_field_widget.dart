import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../common/color_codes.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final Color? color;
  final double radius;
  final double width;
  final GlobalKey<FormState> textFormFieldKey;
  final TextEditingController textEditingController;
  final RxBool? _empty = false.obs;

  CustomTextField({
    Key? key,
    required this.hintText,
    required this.color,
    required this.radius,
    required this.width,
    required this.textFormFieldKey,
    required this.textEditingController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: width,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(radius),
      ),
      child: Obx(
        () => TextFormField(
          autofocus: false,
          controller: textEditingController,
          validator: (String? value) {
            if (value!.isEmpty) {
              _empty!.value = true;
              return "";
            } else {
              return null;
            }
          },
          cursorColor: mainPurple,
          decoration: InputDecoration(
            hintText: _empty!.value ? "Please add a link here" : hintText,
            border: InputBorder.none,
            errorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(4)),
              borderSide: BorderSide(
                width: 1,
                color: Colors.red,
              ),
            ),
            hintStyle: _empty!.value
                ? const TextStyle(color: Colors.red)
                : const TextStyle(color: Colors.black),
          ),
        ),
      ),
    );
  }
}
