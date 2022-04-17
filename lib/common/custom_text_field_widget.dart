import 'package:flutter/material.dart';


class CustomTextField extends StatelessWidget {
final String hintText;
final Color? color;
final double radius;
final double width;
  const CustomTextField({
    Key? key, required this.hintText, required this.color, required this.radius, required this.width


  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width:width,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(radius),
      ),
      child: TextField(
        onChanged: (value){},
        cursorColor: Colors.white,
        decoration:  InputDecoration(
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
