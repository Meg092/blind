import 'package:blind_box/main.dart';
import 'package:blind_box/pages/blind_add/blind_add_view.dart';
import 'package:blind_box/pages/blind_first/blind_first_logic.dart';
import 'package:blind_box/pages/blind_first/blind_first_view.dart';
import 'package:blind_box/pages/blind_second/blind_second_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'blind_tab_logic.dart';

class BlindTabPage extends GetView<BlindTabLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller.pageController,
        children: [BlindFirstPage(), BlindAddPage(), BlindSecondPage()],
      ),
      bottomNavigationBar: Obx(() => _navBlindBars()),
    );
  }

  Widget _navBlindBars() {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Image.asset(
            'assets/item0Grey.webp',
            width: 22,
            height: 22,
            fit: BoxFit.cover,
          ),
          activeIcon: Image.asset(
            'assets/item0Light.webp',
            width: 22,
            height: 22,
            fit: BoxFit.cover,
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                  color: primaryColor, borderRadius: BorderRadius.circular(32)),
              child:const Icon(
                Icons.add,
                color: Colors.white,
                size: 32,
              )),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            'assets/item1Grey.webp',
            width: 22,
            height: 22,
            fit: BoxFit.cover,
          ),
          activeIcon: Image.asset(
            'assets/item1Light.webp',
            width: 22,
            height: 22,
            fit: BoxFit.cover,
          ),
          label: 'Setting',
        ),
      ],
      currentIndex: controller.currentIndex.value,
      onTap: (index) {
        if (index == 1) {
          Get.toNamed('/blindAdd')?.then((_) {
            BlindFirstLogic firstLogic = Get.put(BlindFirstLogic());
            firstLogic.getData();
          });
        } else {
          controller.currentIndex.value = index;
          controller.pageController.jumpToPage(index);
        }
      },
    );
  }
}
