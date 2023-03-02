import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../../controllers/GoogleMapViewController.dart';

class BulletPointCard extends StatelessWidget {
  final mapViewController = Get.put(MapViewController());
  int index;
  BulletPointCard({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(25.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: Color(0xFFEFEFEF),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Text(
                mapViewController.germanyData.value
                    .elementAt(index)["name"]
                    .toString(),
                style: TextStyle(
                    fontSize: 28,
                    fontFamily: "Alegreya Sans",
                    fontWeight: FontWeight.w700,
                    color: Colors.black)),
          ),
          ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: const EdgeInsets.only(top: 0),
              itemCount: (mapViewController.germanyData.value
                      .elementAt(0)["bulletPoints"] as List)
                  .length,
              itemBuilder: ((context, _index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 10, top: 6),
                        width: 15,
                        height: 15,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: const Color(0xFF9D9D9D)),
                      ),
                      Expanded(
                        child: Text(
                            (mapViewController.germanyData.value
                                    .elementAt(0)["bulletPoints"] as List)
                                .elementAt(_index)
                                .toString(),
                            style: const TextStyle(
                                // overflow: TextOverflow.visible,
                                fontSize: 24,
                                fontFamily: "Alegreya Sans",
                                color: Colors.black)),
                      )
                    ],
                  ),
                );
              }))
        ],
      ),
    );
  }
}
