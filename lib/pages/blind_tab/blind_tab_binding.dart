import 'package:get/get.dart';

import '../blind_first/blind_first_logic.dart';
import '../blind_second/blind_second_logic.dart';
import 'blind_tab_logic.dart';

class BlindTabBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BlindTabLogic());
    Get.lazyPut(() => BlindFirstLogic());
    Get.lazyPut(() => BlindSecondLogic());
  }
}
