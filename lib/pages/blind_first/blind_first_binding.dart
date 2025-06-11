import 'package:get/get.dart';

import 'blind_first_logic.dart';

class BlindFirstBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BlindFirstLogic());
  }
}
