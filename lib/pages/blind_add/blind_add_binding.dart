import 'package:get/get.dart';

import 'blind_add_logic.dart';

class BlindAddBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BlindAddLogic());
  }
}
