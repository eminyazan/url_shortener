import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_shortener/common/buttons.dart';
import 'package:url_shortener/common/color_codes.dart';
import 'package:url_shortener/common/custom_shape.dart';
import 'package:url_shortener/common/custom_text_field_widget.dart';
import 'package:url_shortener/common/text_styles.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xfff0f1f6),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
                child: SvgPicture.asset(
                  "assets/images/logo.svg",
                  height: size.height * 0.05,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 18.0),
                child: SvgPicture.asset(
                  "assets/images/illustration.svg",
                  height: size.height * 0.4,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: Text(
                  "Let's get started",
                  style: commonTextStyle(21, FontWeight.bold, Colors.black),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 5, 0, 40.0),
                child: SizedBox(
                  width: size.width * 0.5,
                  child: Text(
                    "Paste your first link into the field to shorten it",
                    style: commonTextStyle(
                      17,
                      FontWeight.w400,
                      Colors.black,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25.0),
                child: Container(
                    width: size.width,
                    height: size.height * 0.245,
                    color: mainPurple,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        //TODO:Add Shape here colo code ----> #4b3f6b

                        CustomTextField(
                          color: Colors.white,
                          hintText: "Shorten a link here...",
                          radius: 7,
                          width: size.width * 0.8,
                        ),
                        CustomButton(
                          width: size.width * 0.8,
                          buttonText: "SHORTEN IT!",
                          height: size.height * 0.06,
                          onPressed: () {},
                          buttonColor:  mainCyan,
                          textColor: Colors.white,
                          radius: 7,
                        ),
                      ],
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
