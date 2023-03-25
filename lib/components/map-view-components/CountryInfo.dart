import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../../controllers/GoogleMapViewController.dart';
import '../../views/CoutryInfoView.dart';
import '../cards/BulletPointCard.dart';

class CountryInfo extends StatefulWidget {
  const CountryInfo({super.key});

  @override
  State<CountryInfo> createState() => _CountryInfoState();
}

class _CountryInfoState extends State<CountryInfo>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  late final Animation<double> _animation;

  List<Widget> components = [
    Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 28.0,
            height: 28.0,
          ),
          Text(
            "Germany",
            style: TextStyle(
                fontSize: 40,
                fontFamily: "Alegreya Sans",
                overflow: TextOverflow.visible),
          ),
          IconButton(
            icon: Icon(
              Icons.info_outline,
              size: 28,
            ),
            color: Color(0xFFC1C1C1),
            onPressed: () {
              Get.to(CoutryInfoView(
                showAddCountryIcon: true,
              ));
            },
          ),
        ],
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
    Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: BulletPointCard(
        index: 0,
      ),
    ),
  ];

  final mapViewController = Get.put(MapViewController());

  closeSearch() {
    mapViewController.closeSearch();
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );

    _animation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(_controller);

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Opacity(
          opacity: _animation.value,
          child: child,
        );
      },
      child: Container(
        margin: EdgeInsets.only(top: 15.0, left: 15.0, right: 15.0),
        child: ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            itemCount: components.length,
            padding: EdgeInsets.all(0),
            itemBuilder: ((context, index) {
              return components[index];
            })),
      ),
    ));
  }
}
