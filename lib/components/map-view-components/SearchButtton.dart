import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/GoogleMapViewController.dart';

class SearchButton extends StatelessWidget {
  SearchButton({super.key});
  final mapViewController = Get.put(MapViewController());

  // AnimationController _controller;

  @override
  Widget build(BuildContext context) {
    return Positioned(
        right: 7,
        top: MediaQuery.of(context).padding.top + 21,
        child: Obx(() => (mapViewController.searchButtonVisible.value
            ? AnimatedContainer(
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.only(right: 21),
                width: mapViewController.searchButtonExpanded.value
                    ? MediaQuery.of(context).size.width - 14
                    : 70.0,
                height: 70,
                duration: const Duration(milliseconds: 200),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: GestureDetector(
                  onTap: () {
                    if (mapViewController.searchButtonExpanded.value) {
                      mapViewController.closeSearch();
                      // mapViewController.setCoutryInfo(false);
                    } else {
                      mapViewController.openSearch();
                    }
                  },
                  child: mapViewController.searchButtonExpanded.value
                      ? Container(
                          padding: const EdgeInsets.only(left: 28.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Flexible(
                                flex: 9,
                                child: TextField(
                                    cursorColor: Color(0xFF4F7E93),
                                    decoration: InputDecoration(
                                      hintStyle: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                          fontFamily: "Alegreya Sans",
                                          overflow: TextOverflow.visible),
                                      hintText:
                                          "  Search for a specific coutry",
                                      focusColor: Colors.grey,
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFF4F7E93),
                                        ),
                                      ),
                                    ),
                                    onChanged: (value) {
                                      mapViewController
                                          .setSearchInputValue(value);
                                    }),
                              ),
                              Flexible(
                                flex: 1,
                                child: Icon(
                                  Icons.search,
                                  size: 28.0,
                                ),
                              ),
                            ],
                          ),
                        )
                      : const Icon(
                          Icons.search,
                          size: 28.0,
                        ),
                ),
              )
            : Container())));
  }
}
