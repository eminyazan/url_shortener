import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../common/consts.dart';
import '../common/custom_snackbar.dart';
import '../common/history_widget.dart';
import '../common/shorter_widget.dart';
import '../controllers/shorten_link_controller.dart';
import '../models/shorten_link_model.dart';
import '../common/color_codes.dart';
import '../common/text_styles.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  final Box<ShortenLink> _shortenLinksBox = Hive.box(localDB);

  final _controller = Get.find<ShortenLinkController>();

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        centerTitle: true,
        title: Text(
          "Your Link History",
          style: commonTextStyle(
            21,
            FontWeight.normal,
            Colors.black,
          ),
        ),
      ),
      body: SafeArea(
        child: Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(bottom:size.height*0.25 ),
                child: StreamBuilder(
                    stream: _shortenLinksBox.watch(),
                    builder:
                        (BuildContext context, AsyncSnapshot<BoxEvent> snapshot) {
                      return _shortenLinksBox.values.isNotEmpty
                          ? ListView.builder(
                        itemCount: _shortenLinksBox.values.length,
                        itemBuilder: (context, index) {
                          return Dismissible(
                            key: UniqueKey(),
                            onDismissed: (direction) async {
                              await _shortenLinksBox.deleteAt(index);
                              ScaffoldMessenger.of(context).showSnackBar(
                                customSnackbar(
                                  'Shorten link deleted from history',
                                  Colors.greenAccent,
                                ),
                              );
                            },
                            child: HistoryWidget(
                              shortenLink:
                              _shortenLinksBox.values.toList()[index],
                              index: index,
                            ),
                          );
                        },
                      )
                          : const Center(
                        child: Text("Let's shorten some links ..."),
                      );
                    }),
              ),
            ),
            ShorterWidget(
              textFormFieldKey: _formKey,
              textEditingController: _textEditingController,
              shortenLinkController: _controller,
            ),

          ],
        ),
      ),
    );
  }
}
