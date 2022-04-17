import 'package:flutter/material.dart';

import 'package:get/get.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final Color buttonColor;
  final Color textColor;
  final double radius;
  final double height;
  final double width;
  final RxBool submitting;
  final VoidCallback onPressed;

  const CustomButton({
    Key? key,
    required this.buttonText,
    this.buttonColor = Colors.blue,
    this.textColor = Colors.white,
    required this.submitting,
    this.radius = 15,
    required this.height,
    required this.width,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      width: width,
      child: SizedBox(
        height: height,
        child: Obx(
          () => submitting.value
              ? Container(
                  width: width,
                  color: buttonColor,
                  child: const LinearProgressIndicator(),
                )
              : RaisedButton(
                  onPressed: onPressed,
                  color: buttonColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(radius),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Text(
                        buttonText,
                        style: TextStyle(
                          color: textColor,
                          fontSize: 21,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
