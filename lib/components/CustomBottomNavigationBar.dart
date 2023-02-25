import 'package:flutter/material.dart';

class MyCustomBottomNavigtionBar extends StatefulWidget {
  int currentIndex;
  Function onClick;
  MyCustomBottomNavigtionBar({
    super.key,
    required this.currentIndex,
    required this.onClick,
  });

  @override
  State<MyCustomBottomNavigtionBar> createState() =>
      _MyCustomBottomNavigtionBarState();
}

class _MyCustomBottomNavigtionBarState
    extends State<MyCustomBottomNavigtionBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: widget.currentIndex == 0
          ? BoxDecoration(boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 10,
                offset: Offset(0, 4),
              )
            ])
          : null,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          NavigationBarItem(
              onClick: () => widget.onClick(0),
              icon: Icons.map_outlined,
              selected: widget.currentIndex == 0 ? true : false),
          NavigationBarItem(
              onClick: () => widget.onClick(1),
              icon: Icons.compare_arrows,
              selected: widget.currentIndex == 1 ? true : false),
          NavigationBarItem(
              onClick: () => widget.onClick(2),
              icon: Icons.support_agent,
              selected: widget.currentIndex == 2 ? true : false),
          NavigationBarItem(
              onClick: () => widget.onClick(3),
              icon: Icons.account_circle_outlined,
              selected: widget.currentIndex == 3 ? true : false),
        ],
      ),
    );
  }
}

class NavigationBarItem extends StatelessWidget {
  IconData icon;
  bool selected;
  Function onClick;

  NavigationBarItem(
      {super.key,
      required this.icon,
      required this.selected,
      required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () => onClick(),
        child: Container(
          // height: 100,
          padding: EdgeInsets.all(30),
          child: Icon(icon,
              size: 28.0, color: selected ? Color(0xFF4F7E93) : Colors.black),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
                top: BorderSide(
                    width: 3.0,
                    color: selected ? Color(0xFF4F7E93) : Colors.transparent)),
          ),
        ),
      ),
    );
  }
}
