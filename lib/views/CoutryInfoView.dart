import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:i_migrate/components/CustomAppBar.dart';
import 'package:i_migrate/components/CustomBottomNavigationBar.dart';

import '../components/cards/BulletPointCard.dart';
import '../controllers/GoogleMapViewController.dart';

class CoutryInfoView extends StatelessWidget {
  CoutryInfoView({super.key});
  final mapViewController = Get.put(MapViewController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        leadingIcon: IconButton(
          icon: Image.asset(
            "lib/assets/Icons/Arrow icon.png",
            width: 28.0,
            height: 28.0,
          ),
          onPressed: () {
            // mapViewController.setInitialState();
            Get.back();
          },
        ),
        title: "Germany",
        tailIcon: IconButton(
          icon: Image.asset(
            "lib/assets/Icons/Plus icon.png",
            width: 28.0,
            height: 28.0,
          ),
          onPressed: () {},
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 15, right: 15, top: 15),
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: BulletPointCard(
                  index: 0,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: BulletPointCard(
                  index: 0,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: BulletPointCard(
                  index: 0,
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar:
          MyCustomBottomNavigtionBar(currentIndex: 0, onClick: () {}),
    );
  }
}
