import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CoutryComparisonCard extends StatelessWidget {
  String coutryName;

  CoutryComparisonCard({super.key, required this.coutryName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print(key);
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 15),
        padding: EdgeInsets.all(25.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: Color(0xFFEFEFEF),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              coutryName,
              style: TextStyle(
                  fontSize: 30,
                  fontFamily: "Alegreya Sans",
                  overflow: TextOverflow.visible),
            ),
          ],
        ),
      ),
    );
  }
}
