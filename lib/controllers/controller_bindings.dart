
import 'package:get/get.dart';

import '../controllers/shorten_link_controller.dart';

class ControllerBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<ShortenLinkController>(ShortenLinkController());
  }
}