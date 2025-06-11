import 'package:blind_box/main.dart';
import 'package:blind_box/pages/blind_add/blind_text_field.dart';
import 'package:blind_box/pages/blind_first/star_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';

import 'blind_add_logic.dart';

class BlindAddPage extends GetView<BlindAddLogic> {
  Widget _item(int index) {
    final titles = ['Normal', 'Hidden'];
    return <Widget>[
      Image.asset(
          'assets/icon${controller.hiddenVersion == index ? 2 : 1}.webp'),
      const SizedBox(
        width: 5,
      ),
      Text(
        titles[index],
        style: TextStyle(
            color: controller.hiddenVersion == index
                ? primaryColor
                : Colors.black45),
      )
    ].toRow().gestures(onTap: () {
      controller.hiddenVersion = index;
      controller.update();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add blind boxes'),
        backgroundColor: Colors.white,
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: GetBuilder<BlindAddLogic>(builder: (_) {
          return SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: <Widget>[
              <Widget>[
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(15),
                  child: <Widget>[
                    const SizedBox(
                      height: 90,
                    ),
                    SizedBox(
                      height: 40,
                      child: <Widget>[
                        const Text(
                          'Brand information',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Expanded(
                            child: BlindTextField(
                                value: controller.brandInformation,
                                textAlign: TextAlign.end,
                                maxLength: 20,
                                onChange: (v) {
                                  controller.brandInformation = v;
                                }))
                      ].toRow(),
                    ),
                    Divider(
                      height: 15,
                      color: Colors.grey.shade300,
                    ),
                    SizedBox(
                      height: 40,
                      child: <Widget>[
                        const Text(
                          'Rating star level',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        StarWidget(
                            value: controller.star,
                            onChange: (v) {
                              controller.star = v.toInt();
                              controller.update();
                            })
                      ].toRow(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween),
                    ),
                    Divider(
                      height: 15,
                      color: Colors.grey.shade300,
                    ),
                    SizedBox(
                      height: 40,
                      child: <Widget>[
                        const Text(
                          'Hidden version',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        <Widget>[_item(0), const SizedBox(width: 5), _item(1)]
                            .toRow(mainAxisAlignment: MainAxisAlignment.end)
                      ].toRow(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween),
                    ),
                    Divider(
                      height: 15,
                      color: Colors.grey.shade300,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Blind box Instructions',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    BlindTextField(
                        maxLength: 200,
                        maxLines: 6,
                        value: controller.mark,
                        padding: EdgeInsets.zero,
                        onChange: (v) {
                          controller.mark = v;
                        }),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      width: double.infinity,
                      height: 50,
                      alignment: Alignment.center,
                      child: const Text(
                        'Add blind boxes',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                        .decorated(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(10))
                        .gestures(onTap: () {
                          controller.addData();
                    })
                  ].toColumn(crossAxisAlignment: CrossAxisAlignment.start),
                )
                    .decorated(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20))
                    .marginOnly(top: 77),
                ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: Container(
                    width: 123,
                    height: 153,
                    child: controller.image == null
                        ? <Widget>[
                            const Icon(
                              Icons.camera_enhance,
                              size: 40,
                              color: Colors.grey,
                            )
                          ].toColumn(
                            mainAxisAlignment: MainAxisAlignment.center)
                        : Image.memory(
                            controller.image!,
                            fit: BoxFit.cover,
                          ),
                  )
                      .decorated(
                          border: Border.all(color: Colors.white, width: 2),
                          color: const Color(0xfff4f4f4),
                          borderRadius: BorderRadius.circular(6))
                      .gestures(onTap: () {
                    controller.imageSelected();
                  }),
                ),
              ].toStack(alignment: Alignment.topCenter)
            ].toColumn(),
          );
        }).marginAll(15),
      ),
    );
  }
}
