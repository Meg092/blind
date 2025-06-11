import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';

import '../blind_first/star_widget.dart';
import 'blind_details_logic.dart';

class BlindDetailsPage extends GetView<BlindDetailsLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details of blind boxes'),
        backgroundColor: Colors.white,
        actions: [
          const Text(
            'Delete',
            style: TextStyle(color: Colors.black87),
          ).marginOnly(right: 20).gestures(onTap: () {
            controller.delete();
          })
        ],
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
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
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black45),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          child: Text(
                        controller.entity.brandInformation,
                        textAlign: TextAlign.end,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                        overflow: TextOverflow.ellipsis,
                      ))
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
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black45),
                      ),
                      IgnorePointer(
                        child: StarWidget(
                            value: controller.entity.star, onChange: (_) {}),
                      )
                    ].toRow(mainAxisAlignment: MainAxisAlignment.spaceBetween),
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
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black45),
                      ),
                      Text(
                        controller.entity.hiddenVersion == 1 ? 'YES' : 'NO',
                        style:const TextStyle(fontWeight: FontWeight.bold),
                      )
                    ].toRow(mainAxisAlignment: MainAxisAlignment.spaceBetween),
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
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black45),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    controller.entity.mark,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  )
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
                    child: Image.memory(
                      controller.entity.image,
                      fit: BoxFit.cover,
                    ),
                  ).decorated(
                      border: Border.all(color: Colors.white, width: 2),
                      color: const Color(0xfff4f4f4),
                      borderRadius: BorderRadius.circular(6))),
            ].toStack(alignment: Alignment.topCenter)
          ].toColumn(),
        ).marginAll(15),
      ),
    );
  }
}
