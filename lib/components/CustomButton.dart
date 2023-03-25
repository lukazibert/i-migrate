import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Function onTap;
  final String text;

  CustomButton({
    super.key,
    required this.onTap,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() => onTap()),
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xFF4F7E93),
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        child: Center(
            child: Text(text,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontFamily: "Alegreya Sans",
                    fontWeight: FontWeight.w300,
                    overflow: TextOverflow.visible))),
      ),
    );
  }
}
