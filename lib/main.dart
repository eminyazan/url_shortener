import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../controllers/controller_bindings.dart';
import '../pages/on_boarding_page.dart';
import 'common/consts.dart';
import 'models/shorten_link_model.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(ShortenLinkAdapter());
  await Hive.openBox<ShortenLink>(localDB);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: ControllerBindings(),
      title: "Shortly",
      debugShowCheckedModeBanner: false,
      home: const OnBoardingPage(),
    );
  }
}
