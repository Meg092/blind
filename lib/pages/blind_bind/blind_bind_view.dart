import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'blind_bind_logic.dart';

class BlindBindView extends GetView<PageLogic> {
  const BlindBindView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Obx(
          () => controller.morissette.value
              ? const CircularProgressIndicator(color: Colors.orangeAccent)
              : buildError(),
        ),
      ),
    );
  }

  Widget buildError() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {
              controller.eugrb();
            },
            icon: const Icon(
              Icons.restart_alt,
              size: 50,
            ),
          ),
        ],
      ),
    );
  }
}
