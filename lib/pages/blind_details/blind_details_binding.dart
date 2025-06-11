import 'package:get/get.dart';

import 'blind_details_logic.dart';

class BlindDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BlindDetailsLogic());
  }
}
