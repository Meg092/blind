import 'package:get/get.dart';

import 'blind_second_logic.dart';

class BlindSecondBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BlindSecondLogic());
  }
}
