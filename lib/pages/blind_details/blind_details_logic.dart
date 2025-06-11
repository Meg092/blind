import 'package:blind_box/db_blind/blind_entity.dart';
import 'package:blind_box/db_blind/db_blind.dart';
import 'package:get/get.dart';

class BlindDetailsLogic extends GetxController {

  DBBlind dbBlind = Get.find();

  BlindEntity entity = Get.arguments;

  void delete() async {
    await dbBlind.deleteBlind(entity.id);
    Get.back();
  }

}
