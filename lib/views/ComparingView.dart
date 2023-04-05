import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_migrate/components/CustomAppBar.dart';

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

  List titles = [
    'Restaurants',
    'Markets',
    'Transportation',
    'Utilities',
    'Leisure',
    'Childcare',
    'Clothing',
    'Rent',
    'Apartment Price',
    'Salaries'
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: Colors.white,
        appBar: CustomAppBar(
          title: titles[selectionController.comparingPageIndex.value],
          leadingIcon: IconButton(
            icon: Image.asset(
              "lib/assets/Icons/Arrow icon.png",
              width: 28.0,
              height: 28.0,
            ),
            onPressed: () {
              Get.back();
              selectionController.stopComparing();
            },
          ),
          tailIcon: IconButton(
            icon: const Icon(
              Icons.info_outline,
              size: 28,
            ),
            onPressed: () {},
          ),
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            children: [
              // The row of selection indicators
              Container(
                color: Colors.white,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Obx(
                    () => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: titles.asMap().entries.map((entry) {
                        int index = entry.key;
                        return Container(
                          height: 15.0,
                          width: 15.0,
                          decoration: index ==
                                  selectionController.comparingPageIndex.value
                              ? BoxDecoration(
                                  border: Border.all(
                                      width: 3, color: Color(0xFF4F7E93)),
                                  borderRadius: BorderRadius.circular(50))
                              : BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Color(0xFF4F7E93),
                                ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),

              // The page view
              Container(
                color: Colors.white,
                height: MediaQuery.of(context).size.height * 0.85,
                width: MediaQuery.of(context).size.width,
                child: PageView.builder(
                  onPageChanged: (value) =>
                      selectionController.setComparingPageIndex(value),
                  itemCount: titles.length,
                  itemBuilder: (context, index) {
                    return ComparingPage(
                      selectedComparingCountries:
                          widget.selectedComparingCountries,
                      title: titles[index],
                    );
                  },
                ),
              ),
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
    return ListView(
      children: <Widget>[
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
      ],
    );
  }
}
