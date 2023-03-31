import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/CustomButton.dart';
import '../components/cards/CountrySelectionCard.dart';
import '../controllers/SelectionViewController.dart';

final selectionController = Get.put(SelectionViewController());

class Compare extends StatefulWidget {
  List<Map> comparingCountries;
  List<Map> selectedComparingCountries = [];
  Compare({
    super.key,
    required this.comparingCountries,
  });

  @override
  State<Compare> createState() => _CompareState();
}

class _CompareState extends State<Compare> {
  @override
  void initState() {
    // TODO: implement initState
    widget.selectedComparingCountries = selectionController
        .selectionCoutries.value
        .where((country) => country['selected'])
        .toList();

    print(widget.selectedComparingCountries);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 10,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xFF4F7E93),
            bottom: const TabBar(
              // labelColor: Color(0xFF4F7E93),
              // overlayColor: Color(0xFF4F7E93),
              // dividerColor: Color(0xFF4F7E93),
              tabs: [
                Tab(icon: Icon(Icons.restaurant)),
                Tab(icon: Icon(Icons.food_bank)),
                Tab(icon: Icon(Icons.emoji_transportation)),
                Tab(icon: Icon(Icons.dangerous)),
                Tab(icon: Icon(Icons.sports_football)),
                Tab(icon: Icon(Icons.child_care)),
                Tab(icon: Icon(Icons.checkroom)),
                Tab(icon: Icon(Icons.house)),
                Tab(icon: Icon(Icons.apartment)),
                Tab(icon: Icon(Icons.attach_money)),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              ComparingPage(
                  selectedComparingCountries: widget.selectedComparingCountries,
                  title: 'Restaurants'),
              ComparingPage(
                  selectedComparingCountries: widget.selectedComparingCountries,
                  title: 'Markets'),
              ComparingPage(
                  selectedComparingCountries: widget.selectedComparingCountries,
                  title: 'Transportation'),
              ComparingPage(
                  selectedComparingCountries: widget.selectedComparingCountries,
                  title: 'Utilities (Monthly)'),
              ComparingPage(
                  selectedComparingCountries: widget.selectedComparingCountries,
                  title: 'Sports And Leisure'),
              ComparingPage(
                  selectedComparingCountries: widget.selectedComparingCountries,
                  title: 'Childcare'),
              ComparingPage(
                  selectedComparingCountries: widget.selectedComparingCountries,
                  title: 'Clothing And Shoes'),
              ComparingPage(
                  selectedComparingCountries: widget.selectedComparingCountries,
                  title: 'Rent Per Month'),
              ComparingPage(
                  selectedComparingCountries: widget.selectedComparingCountries,
                  title: 'Buy Apartment Price'),
              ComparingPage(
                  selectedComparingCountries: widget.selectedComparingCountries,
                  title: 'Salaries And Financing'),
            ],
          ),
        ),
      ),
    );
  }
}

class ComparingPage extends StatelessWidget {
  String title = '';
  List<Map> selectedComparingCountries = [];
  List<DataRow> table = [];
  ComparingPage(
      {super.key,
      required this.title,
      required this.selectedComparingCountries}) {
    if (selectedComparingCountries[0][title] != null) {
      for (var key in selectedComparingCountries[0][title].keys) {
        table.add(
          DataRow(cells: [
            DataCell(Text(key)),
            DataCell(Align(
              alignment: Alignment
                  .center, // Align however you like (i.e .centerRight, centerLeft)
              child: Text(
                "${selectedComparingCountries[0][title][key]}\$",
                textAlign: TextAlign.center,
              ),
            )),
            DataCell(Align(
              alignment: Alignment
                  .center, // Align however you like (i.e .centerRight, centerLeft)
              child: Text(
                "${selectedComparingCountries[1][title][key]}\$",
                textAlign: TextAlign.center,
              ),
            )),
          ]),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: ListView(children: <Widget>[
        Center(
            child: Text(
          "$title ",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        )),
        DataTable(
          columns: [
            DataColumn(
                label: Text('',
                    style:
                        TextStyle(fontSize: 10, fontWeight: FontWeight.bold))),
            DataColumn(
                label: Text(
              selectedComparingCountries[0]['name'],
              style: TextStyle(fontSize: 18),
              softWrap: true,
              maxLines: 1,
            )),
            DataColumn(
                label: Text(
              selectedComparingCountries[1]['name'],
              style: TextStyle(fontSize: 18),
              softWrap: true,
              maxLines: 1,
            )),
          ],
          rows: table,
        ),
      ])),
    );
  }
}
