import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_migrate/controllers/SelectionViewController.dart';

import '../components/CustomButton.dart';
import '../components/cards/CountrySelectionCard.dart';
import 'ComparingView.dart';

class SelectionView extends StatelessWidget {
  SelectionView({
    super.key,
  });

  final selectionController = Get.put(SelectionViewController());

  int selectedCountryes = 0;
  bool compare = false;

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
              child: ListView.builder(
                itemCount: selectionController.selectionCoutries.length,
                itemBuilder: ((context, index) {
                  return GestureDetector(
                    onTap: () {},
                    child: CountrySelectionCard(
                      index: index,
                      countryName: selectionController.selectionCoutries[index]
                          ['name'],
                    ),
                  );
                }),
              ),
            ),
            (selectionController.showCopareButton()
                ? CustomButton(
                    text: "Compare",
                    onTap: (() => Get.to(Compare(
                          comparingCountries:
                              selectionController.selectionCoutries,
                        ))),
                  )
                : Container())
          ],
        ),
      ),
    );
  }
}
