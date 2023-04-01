import 'package:flutter/material.dart';

class Authentication extends StatefulWidget {
  Authentication({
    super.key,
  });

  @override
  State<Authentication> createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  List<Map> coutriesList = [];
  int selectedCountryes = 0;

  @override
  void initState() {
    // TODO: implement initState
    coutriesList = [
      {'name': "Germany", 'selected': false},
      {'name': "Italy", 'selected': false},
      {'name': "United Kingdom", 'selected': false},
      {'name': "U SA", 'selected': false}
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        padding: EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 5),
        child: Scaffold());
  }
}
