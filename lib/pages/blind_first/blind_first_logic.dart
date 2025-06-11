import 'package:blind_box/db_blind/db_blind.dart';
import 'package:get/get.dart';

import '../../db_blind/blind_entity.dart';

class BlindFirstLogic extends GetxController {

  DBBlind dbBlind = Get.find();

  int timeType = -1;
  int starType = -1;

  var list = <BlindEntity>[].obs;

  void getData() async {
    var result = await dbBlind.getBlindAllData();
    if (timeType == 0) {
      result.sort((a, b) => a.createdTime.compareTo(b.createdTime));
    } else if (timeType == 1) {
      result.sort((a, b) => b.createdTime.compareTo(a.createdTime));
    }
    if (starType == 0) {
      result.sort((a, b) => a.star.compareTo(b.star));
    } else if (starType == 1) {
      result.sort((a, b) => b.star.compareTo(a.star));
    }
    list.value = result;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getData();
    super.onInit();
  }

}
