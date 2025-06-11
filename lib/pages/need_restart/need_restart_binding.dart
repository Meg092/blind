import 'package:get/get.dart';

import 'need_restart_logic.dart';

class NeedRestartBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NeedRestartLogic());
  }
}
