import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../controllers/GoogleMapViewController.dart';

class CountryNameCard extends StatefulWidget {
  String coutryName;
  CountryNameCard({super.key, required this.coutryName});

  @override
  State<CountryNameCard> createState() => _CountryNameCardState();
}

class _CountryNameCardState extends State<CountryNameCard>
    with SingleTickerProviderStateMixin {
  final mapViewController = Get.put(MapViewController());

  late final AnimationController _controller;

  late final Animation<double> _animation;

  final slovaniaCameraPosition = CameraPosition(
    target: LatLng(43.7, 14.995463),
    zoom: 6.8,
  );

  final finalGermanyCameraPosition =
      CameraPosition(target: LatLng(42.165691, 10.451526), zoom: 5);

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
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
    return GestureDetector(
      onTap: () {
        mapViewController.animateCamera(finalGermanyCameraPosition);
        mapViewController.selectSpecificCountry();
      },
      child: AnimatedBuilder(
        builder: (context, child) {
          return Opacity(
            opacity: _animation.value,
            child: Transform.translate(
              offset: Offset(0, 50 * (1 - _animation.value)),
              child: child,
            ),
          );
        },
        animation: _animation,
        child: Container(
          margin: EdgeInsets.only(bottom: 15),
          padding: EdgeInsets.all(25.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color: Color(0xFFEFEFEF)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.coutryName,
                style: TextStyle(
                    fontSize: 30,
                    fontFamily: "Alegreya Sans",
                    overflow: TextOverflow.visible),
              ),
              Icon(
                Icons.info_outline,
                color: Color(0xFFC1C1C1),
                size: 28.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
