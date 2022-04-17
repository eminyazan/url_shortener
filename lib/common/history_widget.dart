import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import '../common/custom_snackbar.dart';
import '../common/text_styles.dart';
import '../models/shorten_link_model.dart';
import '../services/local_database_service.dart';
import 'buttons.dart';
import 'color_codes.dart';

class HistoryWidget extends StatelessWidget {
  final ShortenLink shortenLink;
  final int index;

  HistoryWidget({Key? key, required this.shortenLink, required this.index})
      : super(key: key);
  final LocalDatabaseService _localDatabaseService = LocalDatabaseService();
  final RxBool _copied = false.obs;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: size.height * 0.2,
        width: size.width * 0.9,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(
              10,
            ),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      shortenLink.originalLink,
                      style: commonTextStyle(23, FontWeight.w400, Colors.black),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      softWrap: false,
                    ),
                  ),
                  IconButton(
                    onPressed: () async {
                      await _localDatabaseService.deleteFromHistory(
                        index,
                      );
                      ScaffoldMessenger.of(context).showSnackBar(
                        customSnackbar(
                          'Shorten link deleted from history',
                          Colors.greenAccent,
                        ),
                      );
                    },
                    icon: const Icon(Icons.delete),
                  )
                ],
              ),
            ),
            const Divider(
              thickness: 2,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      shortenLink.shortLink,
                      style: commonTextStyle(23, FontWeight.bold, mainCyan),
                      overflow: TextOverflow.fade,
                      maxLines: 1,
                      softWrap: false,
                    ),
                  ),
                ],
              ),
            ),
            Obx(
              () => CustomButton(
                buttonText: _copied.value ? "COPIED" : "COPY",
                submitting: false.obs,
                height: size.height * 0.05,
                width: size.width * 0.7,
                radius: 5,
                buttonColor: _copied.value ? mainPurple : mainCyan,
                onPressed: () {
                  _copyShortLink(shortenLink.shortLink);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _copyShortLink(String shortUrl) {
    Clipboard.setData(
      ClipboardData(
        text: shortUrl,
      ),
    );
    _copied.value = !_copied.value;
  }
}
