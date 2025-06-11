import 'dart:typed_data';

import 'package:blind_box/db_blind/db_blind.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../db_blind/blind_entity.dart';

class BlindAddLogic extends GetxController {

  DBBlind dbBlind = Get.find();

  Uint8List? image;
  String brandInformation = '';
  int star = 1;
  int hiddenVersion = 0;
  String mark = '';

  void imageSelected() async {
    final picker = ImagePicker();
    try {
      final pickedFile = await picker.pickImage(imageQuality: 90,maxWidth: 1024,source: ImageSource.gallery);
      if (pickedFile != null) {
        final imageBytes = await pickedFile.readAsBytes();
        image = imageBytes;
        update();
      }
    } catch (e) {
      Fluttertoast.showToast(msg: 'Please check album permissions or select a new image');
      return;
    }
  }

  void addData() async {
    if (image == null) {
      Fluttertoast.showToast(msg: 'Please select an image');
      return;
    }
    if (brandInformation.isEmpty) {
      Fluttertoast.showToast(msg: 'Please enter the brand information');
      return;
    }
    if (mark.isEmpty) {
      Fluttertoast.showToast(msg: 'Please enter the mark');
      return;
    }
    await dbBlind.insertBlind(BlindEntity(
      id: 0,
      createdTime: DateTime.now(),
      image: image!,
      brandInformation: brandInformation,
      star: star,
      hiddenVersion: hiddenVersion,
      mark: mark,
    ));
    Fluttertoast.showToast(msg: 'Added successfully');
    Get.back();
  }

}
