import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  Widget leadingIcon;
  Widget tailIcon;
  String title;

  CustomAppBar(
      {super.key,
      required this.title,
      required this.leadingIcon,
      required this.tailIcon});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Theme(
          data: ThemeData(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent),
          child: leadingIcon),
      actions: [
        Theme(
            data: ThemeData(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent),
            child: Padding(
              padding: const EdgeInsets.only(right: 21.0),
              child: tailIcon,
            ))
      ],
      shadowColor: Colors.transparent,
      backgroundColor: Colors.white,
      title: Text(
        title,
        style: TextStyle(
            fontSize: 40,
            fontFamily: "Alegreya Sans",
            fontWeight: FontWeight.w500,
            color: Colors.black),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
