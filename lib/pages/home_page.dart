import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../common/shorter_widget.dart';
import '../common/color_codes.dart';
import '../common/text_styles.dart';
import '../controllers/shorten_link_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = Get.find<ShortenLinkController>();

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _textEditingController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
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
              ShorterWidget(
                textEditingController: _textEditingController,
                textFormFieldKey: _formKey,
                shortenLinkController: _controller,
              )
            ],
          ),
        ),
      ),
    );
  }
}
