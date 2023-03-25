import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../cards/CountryNameCard.dart';
import '../../controllers/GoogleMapViewController.dart';

class CoutryInfoList extends StatelessWidget {
  CoutryInfoList({super.key});

  final mapViewController = Get.put(MapViewController());

  @override
  Widget build(BuildContext context) {
    return mapViewController.filterCoutry().isNotEmpty
        ? Expanded(
            child: Container(
              margin: EdgeInsets.only(top: 15.0, left: 15.0, right: 15.0),
              child: Obx(
                () => ListView.builder(
                  padding: EdgeInsets.all(0),
                  itemCount: mapViewController.filterCoutry().length,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: ((context, index) {
                    return CountryNameCard(
                        coutryName: mapViewController.filterCoutry()[index]);
                  }),
                ),
              ),
            ),
          )
        : Padding(
            padding: const EdgeInsets.all(25.0),
            child: Text(
              "I am sorry but there are no cutries avaliable by this name",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color(0xFFC1C1C1),
                  fontSize: 20,
                  fontFamily: "Alegreya Sans",
                  overflow: TextOverflow.visible),
            ),
          );
  }
}
