import 'package:flutter/material.dart';
import 'test.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: SelectionView(),
    );
  }
}

class SelectionView extends StatelessWidget {
  const SelectionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Selection"),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 5),
        child: Column(children: [
          Container(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Germany",
                    style: TextStyle(
                      fontSize: 40,
                      fontFamily: 'Alegreya Sans',
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                  Icon(
                    Icons.info_outline,
                    color: Colors.grey,
                  ),
                ]),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Color(0xFFEFEFEF),
            ),
            padding: EdgeInsets.all(25),
          ),
        ]),
      ),
    );
  }
}
