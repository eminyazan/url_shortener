import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/shorten_link_controller.dart';
import '../models/shorten_link_model.dart';
import '../pages/history_page.dart';

import 'buttons.dart';
import 'color_codes.dart';
import 'custom_shape.dart';
import 'custom_text_field_widget.dart';

class ShorterWidget extends StatelessWidget {
  final GlobalKey<FormState> textFormFieldKey;
  final TextEditingController textEditingController;
  final RxBool _submitting = false.obs;
  final ShortenLinkController shortenLinkController;
  ShorterWidget({Key? key,required this.textFormFieldKey, required this.textEditingController, required this.shortenLinkController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return  Padding(
      padding: const EdgeInsets.only(top: 25.0),
      child: Container(
        width: size.width,
        height: size.height * 0.245,
        color: mainPurple,
        child: Stack(
          alignment: AlignmentDirectional.topEnd,
          children: [
            CustomPaint(
              size: Size(
                  size.width * 0.6, (size.width * 0.5).toDouble()),
              painter: RPSCustomPainter(),
            ),
            Align(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Form(
                    key: textFormFieldKey,
                    child: Column(
                      children: [
                        CustomTextField(
                          color: Colors.white,
                          hintText: "Shorten a link here...",
                          radius: 7,
                          width: size.width * 0.8,
                          textEditingController:
                          textEditingController,
                          textFormFieldKey: textFormFieldKey,
                        ),
                        CustomButton(
                          submitting: _submitting,
                          width: size.width * 0.8,
                          buttonText: "SHORTEN IT!",
                          height: size.height * 0.06,
                          onPressed: () => _formSubmit(),
                          buttonColor: mainCyan,
                          textColor: Colors.white,
                          radius: 7,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  void _formSubmit() async {
    if (textFormFieldKey.currentState!.validate()) {
      textFormFieldKey.currentState!.save();
      _submitting.value = true;
      ShortenLink? _shortenLink =
      await shortenLinkController.fetchShortLink(textEditingController.text);
      if (_shortenLink != null) {
        textEditingController.clear();
        _submitting.value = false;
        Get.to(() => const HistoryPage());
      } else {
        _submitting.value = false;
      }
    }
  }
}
