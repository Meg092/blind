import 'package:blind_box/pages/blind_first/star_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';

import 'blind_first_logic.dart';

class BlindFirstPage extends GetView<BlindFirstLogic> {
  Widget _topItem(int index, int type) {
    final titles = ['Time', 'Score'];
    Widget arrowWidget = Container();
    if (type == -1) {
      arrowWidget = <Widget>[
        Image.asset(
          'assets/img0.webp',
          fit: BoxFit.cover,
        ),
        const SizedBox(
          height: 2,
        ),
        Image.asset(
          'assets/img1.webp',
          fit: BoxFit.cover,
        )
      ].toColumn();
    } else if (type == 0) {
      arrowWidget = <Widget>[
        Image.asset(
          'assets/img2.webp',
          fit: BoxFit.cover,
        ),
        const SizedBox(
          height: 2,
        ),
        Image.asset(
          'assets/img1.webp',
          fit: BoxFit.cover,
        )
      ].toColumn();
    } else if (type == 1) {
      arrowWidget = <Widget>[
        Image.asset(
          'assets/img0.webp',
          fit: BoxFit.cover,
        ),
        const SizedBox(
          height: 2,
        ),
        Image.asset(
          'assets/img3.webp',
          fit: BoxFit.cover,
        )
      ].toColumn();
    }
    return <Widget>[
      Text(
        titles[index],
        style: const TextStyle(color: Colors.black54),
      ),
      const SizedBox(
        width: 5,
      ),
      arrowWidget
    ].toRow().gestures(onTap: () {
      if (index == 0) {
        if (controller.timeType == -1) {
          controller.timeType = 0;
        } else if (controller.timeType == 0) {
          controller.timeType = 1;
        } else if (controller.timeType == 1) {
          controller.timeType = 0;
        }
      } else {
        if (controller.starType == -1) {
          controller.starType = 0;
        } else if (controller.starType == 0) {
          controller.starType = 1;
        } else if (controller.starType == 1) {
          controller.starType = 0;
        }
      }
      controller.update();
      controller.getData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(title: const Text('Blind box record'),automaticallyImplyLeading: false,),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: SafeArea(
            child: Container(
          width: double.infinity,
          height: double.infinity,
          padding: const EdgeInsets.all(12),
          child: <Widget>[
            GetBuilder<BlindFirstLogic>(
                init: BlindFirstLogic(),
                builder: (_) {
                  return <Widget>[
                    _topItem(0, controller.timeType),
                    const SizedBox(
                      width: 15,
                    ),
                    _topItem(1, controller.starType)
                  ].toRow(mainAxisAlignment: MainAxisAlignment.end);
                }),
            const SizedBox(
              height: 10,
            ),
            Expanded(child: Obx(() {
              return controller.list.value.isEmpty
                  ? const Center(
                      child: Text('No data'),
                    )
                  : GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 10,
                              childAspectRatio: 148 / 209),
                      itemCount: controller.list.value.length,
                      itemBuilder: (_, index) {
                        final entity = controller.list.value[index];
                        return <Widget>[
                          ClipRRect(
                            borderRadius: BorderRadius.circular(6),
                            child: Image.memory(
                              entity.image,
                              width: double.infinity,
                              height: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12),
                            child: Container(
                              child: <Widget>[
                                <Widget>[
                                  Expanded(
                                      child: Text(
                                    entity.brandInformation,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                    overflow: TextOverflow.ellipsis,
                                  )),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Image.asset(
                                    'assets/icon0.webp',
                                    fit: BoxFit.cover,
                                  )
                                ].toRow(),
                                <Widget>[
                                  Text(
                                    entity.createdTimeStr,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  IgnorePointer(
                                    child: StarWidget(
                                        value: entity.star, onChange: (_) {}),
                                  )
                                ].toColumn(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start)
                              ].toColumn(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start),
                            ),
                          )
                        ].toStack().gestures(onTap: () {
                          Get.toNamed('/blindDetails',
                                  arguments: entity)
                              ?.then((_) {
                            controller.getData();
                          });
                        });
                      });
            }))
          ].toColumn(),
        )
                .decorated(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                        colors: [Colors.white, Colors.white.withOpacity(0)],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter))
                .marginAll(15)),
      ).decorated(
          image: const DecorationImage(
              image: AssetImage('assets/bg.webp'), fit: BoxFit.fill)),
    );
  }
}
