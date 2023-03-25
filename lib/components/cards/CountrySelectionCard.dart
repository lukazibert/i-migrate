import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_migrate/views/CoutryInfoView.dart';

import '../../controllers/SelectionViewController.dart';

class CountrySelectionCard extends StatefulWidget {
  String countryName;
  int index;

  CountrySelectionCard({required this.countryName, required this.index});

  @override
  State<CountrySelectionCard> createState() => _CountrySelectionCardState();
}

class _CountrySelectionCardState extends State<CountrySelectionCard>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  late final Animation<double> _animation;

  final selectionController = Get.put(SelectionViewController());

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
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
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Opacity(
          opacity: _animation.value,
          child: Transform.translate(
            offset: Offset(0, 50 * (1 - _animation.value)),
            child: child,
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 15),
        padding: EdgeInsets.all(25.0),
        child: Row(
          children: [
            Flexible(
              child: Text(
                widget.countryName,
                style: TextStyle(
                    fontSize: 30,
                    fontFamily: "Alegreya Sans",
                    fontWeight: FontWeight.w300,
                    overflow: TextOverflow.visible),
              ),
            ),
            Obx(() => (selectionController.isComparing.value
                ? GestureDetector(
                    onTap: () {
                      selectionController.selectCountry(widget.countryName);
                    },
                    child: (selectionController.selectionCoutries
                            .elementAt(widget.index)["selected"]
                        ? Container(
                            width: 28,
                            height: 28,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Color(0xFF4F7E93),
                              border: Border.all(
                                color: Color(0xFF4F7E93),
                                width: 4,
                              ),
                            ),
                            child: Image.asset(
                                "lib/assets/Icons/Selected icon.png"),
                          )
                        : Container(
                            width: 28,
                            height: 28,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.transparent,
                              border: Border.all(
                                color: Color(0xFF4F7E93),
                                width: 4,
                              ),
                            ),
                          )))
                : GestureDetector(
                    onTap: () => Get.to(() => CoutryInfoView(
                          showAddCountryIcon: false,
                        )),
                    child: Icon(
                      Icons.info_outline,
                      color: Colors.grey,
                      size: 28.0,
                    ),
                  ))),
          ],
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Color(0xFFEFEFEF),
        ),
      ),
    );
  }
}
