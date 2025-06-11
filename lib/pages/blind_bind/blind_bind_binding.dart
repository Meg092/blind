import 'package:get/get.dart';

import 'blind_bind_logic.dart';

class BlindBindBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      PageLogic(),
      permanent: true,
    );
  }
}
