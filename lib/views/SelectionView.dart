import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:i_migrate/components/cards/CoutryComparisonCard.dart';
import 'package:i_migrate/controllers/SelectionViewController.dart';

import '../components/CustomButton.dart';
import '../components/cards/CountrySelectionCard.dart';

class SelectionView extends StatelessWidget {
  SelectionView({
    super.key,
  });

  final selectionController = Get.put(SelectionViewController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        color: Colors.white,
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              // color: Colors.white,
              // padding: EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 5),
              child: ListView.builder(
                itemCount: selectionController.selectionCoutries.length,
                itemBuilder: ((context, index) {
                  return CountrySelectionCard(
                      index: index,
                      countryName: selectionController.selectionCoutries[index]
                          ["name"]);
                }),
              ),
            ),
            (selectionController.showCopareButton()
                ? CustomButton(
                    text: "Compare",
                    onTap: (() => {}),
                  )
                : Container())
          ],
        ),
      ),
    );
  }
}
