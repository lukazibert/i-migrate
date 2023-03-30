// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:i_migrate/components/cards/CoutryComparisonCard.dart';
import 'package:i_migrate/controllers/SelectionViewController.dart';

import '../components/CustomButton.dart';
import '../components/cards/CountrySelectionCard.dart';

class SelectionView extends StatefulWidget {
  SelectionView({
    super.key,
  });

  @override
  State<SelectionView> createState() => _SelectionViewState();
}

class _SelectionViewState extends State<SelectionView> {
  List<Map> coutriesList = [
    {
      'name': "Germany",
      'selected': false,
      'Restaurants': {
        'Meal, Inexpensive Restaurant': 0,
        'Meal for 2 People, Mid-range Restaurant, Three-course': 0,
        'McMeal at McDonalds (or Equivalent Combo Meal)': 0,
        'Domestic Beer (0.5 liter draught)': 0,
        'Imported Beer (0.33 liter bottle)': 0,
        'Cappuccino (regular)': 0,
        'Coke/Pepsi (0.33 liter bottle)': 0,
        'Water (0.33 liter bottle)': 0
      },
      'Markets': {
        'Milk (regular), (1 liter)': 0,
        'Loaf of Fresh White Bread (500g)': 0,
        'Rice (white), (1kg)': 0,
        'Eggs (regular) (12)': 0,
        'Local Cheese (1kg)': 0,
        'Chicken Fillets (1kg)': 0,
        'Beef Round (1kg) (or Equivalent Back Leg Red Meat)': 0,
        'Apples (1kg)': 0,
        'Banana (1kg)': 0,
        'Oranges (1kg)': 0,
        'Tomato (1kg)': 0,
        'Potato (1kg)': 0,
        'Onion (1kg)': 0,
        'Lettuce (1 head)': 0,
        'Water (1.5 liter bottle)': 0,
        'Bottle of Wine (Mid-Range)': 0,
        'Domestic Beer (0.5 liter bottle)': 0,
        'Imported Beer (0.33 liter bottle)': 0,
        'Cigarettes 20 Pack (Marlboro)': 0,
      },
      'Transportation': {
        'One-way Ticket (Local Transport)': 0,
        'Monthly Pass (Regular Price)': 0,
        'Taxi Start (Normal Tariff)': 0,
        'Taxi 1km (Normal Tariff)': 0,
        'Taxi 1hour Waiting (Normal Tariff)': 0,
        'Gasoline (1 liter)': 0,
        'Volkswagen Golf 1.4 90 KW Trendline (Or Equivalent New Car)': 0,
        'Toyota Corolla Sedan 1.6l 97kW Comfort (Or Equivalent New Car)': 0,
      },
      'Utilities (Monthly)': {
        'Basic (Electricity, Heating, Cooling, Water, Garbage) for 85m2 Apartment':
            0,
        '1 min. of Prepaid Mobile Tariff Local (No Discounts or Plans)': 0,
        'Internet (60 Mbps or More, Unlimited Data, Cable/ADSL)': 0,
      },
      'Sports And Leisure': {
        'Fitness Club, Monthly Fee for 1 Adult': 0,
        'Tennis Court Rent (1 Hour on Weekend)': 0,
        'Cinema, International Release, 1 Seat': 0,
      },
      'Childcare': {
        'Preschool (or Kindergarten), Full Day, Private, Monthly for 1 Child':
            0,
        'International Primary School, Yearly for 1 Child': 0,
      },
      'Clothing And Shoes': {
        '1 Pair of Jeans (Levis 501 Or Similar)': 0,
        '1 Summer Dress in a Chain Store (Zara, H&M, ...)': 0,
        '1 Pair of Nike Running Shoes (Mid-Range)': 0,
        '1 Pair of Men Leather Business Shoes': 0,
      },
      'Rent Per Month': {
        'Apartment (1 bedroom) in City Centre': 0,
        'Apartment (1 bedroom) Outside of Centre': 0,
        'Apartment (3 bedrooms) in City Centre': 0,
        'Apartment (3 bedrooms) Outside of Centre': 0,
      },
      'Buy Apartment Price': {
        'Price per Square Meter to Buy Apartment in City Centre': 0,
        'Price per Square Meter to Buy Apartment Outside of Centre': 0,
      },
      'Salaries And Financing': {
        'Average Monthly Net Salary (After Tax)': 0,
        'Mortgage Interest Rate in Percentages (%), Yearly, for 20 Years Fixed-Rate':
            0,
      }
    },
    {
      'name': "Italy",
      'selected': false,
      'Restaurants': {
        'Meal, Inexpensive Restaurant': 1,
        'Meal for 2 People, Mid-range Restaurant, Three-course': 1,
        'McMeal at McDonalds (or Equivalent Combo Meal)': 1,
        'Domestic Beer (0.5 liter draught)': 1,
        'Imported Beer (0.33 liter bottle)': 1,
        'Cappuccino (regular)': 1,
        'Coke/Pepsi (0.33 liter bottle)': 1,
        'Water (0.33 liter bottle)': 0
      },
      'Markets': {
        'Milk (regular), (1 liter)': 1,
        'Loaf of Fresh White Bread (500g)': 1,
        'Rice (white), (1kg)': 1,
        'Eggs (regular) (12)': 1,
        'Local Cheese (1kg)': 1,
        'Chicken Fillets (1kg)': 1,
        'Beef Round (1kg) (or Equivalent Back Leg Red Meat)': 1,
        'Apples (1kg)': 1,
        'Banana (1kg)': 1,
        'Oranges (1kg)': 1,
        'Tomato (1kg)': 1,
        'Potato (1kg)': 1,
        'Onion (1kg)': 1,
        'Lettuce (1 head)': 1,
        'Water (1.5 liter bottle)': 1,
        'Bottle of Wine (Mid-Range)': 1,
        'Domestic Beer (0.5 liter bottle)': 1,
        'Imported Beer (0.33 liter bottle)': 1,
        'Cigarettes 20 Pack (Marlboro)': 1,
      },
      'Transportation': {
        'One-way Ticket (Local Transport)': 1,
        'Monthly Pass (Regular Price)': 1,
        'Taxi Start (Normal Tariff)': 1,
        'Taxi 1km (Normal Tariff)': 1,
        'Taxi 1hour Waiting (Normal Tariff)': 1,
        'Gasoline (1 liter)': 1,
        'Volkswagen Golf 1.4 90 KW Trendline (Or Equivalent New Car)': 1,
        'Toyota Corolla Sedan 1.6l 97kW Comfort (Or Equivalent New Car)': 1,
      },
      'Utilities (Monthly)': {
        'Basic (Electricity, Heating, Cooling, Water, Garbage) for 85m2 Apartment':
            1,
        '1 min. of Prepaid Mobile Tariff Local (No Discounts or Plans)': 1,
        'Internet (60 Mbps or More, Unlimited Data, Cable/ADSL)': 1,
      },
      'Sports And Leisure': {
        'Fitness Club, Monthly Fee for 1 Adult': 1,
        'Tennis Court Rent (1 Hour on Weekend)': 1,
        'Cinema, International Release, 1 Seat': 1,
      },
      'Childcare': {
        'Preschool (or Kindergarten), Full Day, Private, Monthly for 1 Child':
            1,
        'International Primary School, Yearly for 1 Child': 1,
      },
      'Clothing And Shoes': {
        '1 Pair of Jeans (Levis 501 Or Similar)': 1,
        '1 Summer Dress in a Chain Store (Zara, H&M, ...)': 1,
        '1 Pair of Nike Running Shoes (Mid-Range)': 1,
        '1 Pair of Men Leather Business Shoes': 1,
      },
      'Rent Per Month': {
        'Apartment (1 bedroom) in City Centre': 1,
        'Apartment (1 bedroom) Outside of Centre': 1,
        'Apartment (3 bedrooms) in City Centre': 1,
        'Apartment (3 bedrooms) Outside of Centre': 1,
      },
      'Buy Apartment Price': {
        'Price per Square Meter to Buy Apartment in City Centre': 1,
        'Price per Square Meter to Buy Apartment Outside of Centre': 1,
      },
      'Salaries And Financing': {
        'Average Monthly Net Salary (After Tax)': 1,
        'Mortgage Interest Rate in Percentages (%), Yearly, for 20 Years Fixed-Rate':
            1,
      }
    },
    {
      'name': "United Kingdom",
      'selected': false,
      'Restaurants': {
        'Meal, Inexpensive Restaurant': 2,
        'Meal for 2 People, Mid-range Restaurant, Three-course': 2,
        'McMeal at McDonalds (or Equivalent Combo Meal)': 2,
        'Domestic Beer (0.5 liter draught)': 2,
        'Imported Beer (0.33 liter bottle)': 2,
        'Cappuccino (regular)': 2,
        'Coke/Pepsi (0.33 liter bottle)': 2,
        'Water (0.33 liter bottle)': 0
      },
      'Markets': {
        'Milk (regular), (1 liter)': 2,
        'Loaf of Fresh White Bread (500g)': 2,
        'Rice (white), (1kg)': 2,
        'Eggs (regular) (12)': 2,
        'Local Cheese (1kg)': 2,
        'Chicken Fillets (1kg)': 2,
        'Beef Round (1kg) (or Equivalent Back Leg Red Meat)': 2,
        'Apples (1kg)': 2,
        'Banana (1kg)': 2,
        'Oranges (1kg)': 2,
        'Tomato (1kg)': 2,
        'Potato (1kg)': 2,
        'Onion (1kg)': 2,
        'Lettuce (1 head)': 2,
        'Water (1.5 liter bottle)': 2,
        'Bottle of Wine (Mid-Range)': 2,
        'Domestic Beer (0.5 liter bottle)': 2,
        'Imported Beer (0.33 liter bottle)': 2,
        'Cigarettes 20 Pack (Marlboro)': 2,
      },
      'Transportation': {
        'One-way Ticket (Local Transport)': 2,
        'Monthly Pass (Regular Price)': 2,
        'Taxi Start (Normal Tariff)': 2,
        'Taxi 1km (Normal Tariff)': 2,
        'Taxi 1hour Waiting (Normal Tariff)': 2,
        'Gasoline (1 liter)': 2,
        'Volkswagen Golf 1.4 90 KW Trendline (Or Equivalent New Car)': 2,
        'Toyota Corolla Sedan 1.6l 97kW Comfort (Or Equivalent New Car)': 2,
      },
      'Utilities (Monthly)': {
        'Basic (Electricity, Heating, Cooling, Water, Garbage) for 85m2 Apartment':
            2,
        '1 min. of Prepaid Mobile Tariff Local (No Discounts or Plans)': 2,
        'Internet (60 Mbps or More, Unlimited Data, Cable/ADSL)': 2,
      },
      'Sports And Leisure': {
        'Fitness Club, Monthly Fee for 1 Adult': 2,
        'Tennis Court Rent (1 Hour on Weekend)': 2,
        'Cinema, International Release, 1 Seat': 2,
      },
      'Childcare': {
        'Preschool (or Kindergarten), Full Day, Private, Monthly for 1 Child':
            2,
        'International Primary School, Yearly for 1 Child': 2,
      },
      'Clothing And Shoes': {
        '1 Pair of Jeans (Levis 501 Or Similar)': 2,
        '1 Summer Dress in a Chain Store (Zara, H&M, ...)': 2,
        '1 Pair of Nike Running Shoes (Mid-Range)': 2,
        '1 Pair of Men Leather Business Shoes': 2,
      },
      'Rent Per Month': {
        'Apartment (1 bedroom) in City Centre': 2,
        'Apartment (1 bedroom) Outside of Centre': 2,
        'Apartment (3 bedrooms) in City Centre': 2,
        'Apartment (3 bedrooms) Outside of Centre': 2,
      },
      'Buy Apartment Price': {
        'Price per Square Meter to Buy Apartment in City Centre': 2,
        'Price per Square Meter to Buy Apartment Outside of Centre': 2,
      },
      'Salaries And Financing': {
        'Average Monthly Net Salary (After Tax)': 2,
        'Mortgage Interest Rate in Percentages (%), Yearly, for 20 Years Fixed-Rate':
            2,
      }
    },
    {
      'name': "USA",
      'selected': false,
      'Restaurants': {
        'Meal, Inexpensive Restaurant': 3,
        'Meal for 2 People, Mid-range Restaurant, Three-course': 3,
        'McMeal at McDonalds (or Equivalent Combo Meal)': 3,
        'Domestic Beer (0.5 liter draught)': 3,
        'Imported Beer (0.33 liter bottle)': 3,
        'Cappuccino (regular)': 3,
        'Coke/Pepsi (0.33 liter bottle)': 3,
        'Water (0.33 liter bottle)': 0
      },
      'Markets': {
        'Milk (regular), (1 liter)': 3,
        'Loaf of Fresh White Bread (500g)': 3,
        'Rice (white), (1kg)': 3,
        'Eggs (regular) (12)': 3,
        'Local Cheese (1kg)': 3,
        'Chicken Fillets (1kg)': 3,
        'Beef Round (1kg) (or Equivalent Back Leg Red Meat)': 3,
        'Apples (1kg)': 3,
        'Banana (1kg)': 3,
        'Oranges (1kg)': 3,
        'Tomato (1kg)': 3,
        'Potato (1kg)': 3,
        'Onion (1kg)': 3,
        'Lettuce (1 head)': 3,
        'Water (1.5 liter bottle)': 3,
        'Bottle of Wine (Mid-Range)': 3,
        'Domestic Beer (0.5 liter bottle)': 3,
        'Imported Beer (0.33 liter bottle)': 3,
        'Cigarettes 20 Pack (Marlboro)': 3,
      },
      'Transportation': {
        'One-way Ticket (Local Transport)': 3,
        'Monthly Pass (Regular Price)': 3,
        'Taxi Start (Normal Tariff)': 3,
        'Taxi 1km (Normal Tariff)': 3,
        'Taxi 1hour Waiting (Normal Tariff)': 3,
        'Gasoline (1 liter)': 3,
        'Volkswagen Golf 1.4 90 KW Trendline (Or Equivalent New Car)': 3,
        'Toyota Corolla Sedan 1.6l 97kW Comfort (Or Equivalent New Car)': 3,
      },
      'Utilities (Monthly)': {
        'Basic (Electricity, Heating, Cooling, Water, Garbage) for 85m2 Apartment':
            3,
        '1 min. of Prepaid Mobile Tariff Local (No Discounts or Plans)': 3,
        'Internet (60 Mbps or More, Unlimited Data, Cable/ADSL)': 3,
      },
      'Sports And Leisure': {
        'Fitness Club, Monthly Fee for 1 Adult': 3,
        'Tennis Court Rent (1 Hour on Weekend)': 3,
        'Cinema, International Release, 1 Seat': 3,
      },
      'Childcare': {
        'Preschool (or Kindergarten), Full Day, Private, Monthly for 1 Child':
            3,
        'International Primary School, Yearly for 1 Child': 3,
      },
      'Clothing And Shoes': {
        '1 Pair of Jeans (Levis 501 Or Similar)': 3,
        '1 Summer Dress in a Chain Store (Zara, H&M, ...)': 3,
        '1 Pair of Nike Running Shoes (Mid-Range)': 3,
        '1 Pair of Men Leather Business Shoes': 3,
      },
      'Rent Per Month': {
        'Apartment (1 bedroom) in City Centre': 3,
        'Apartment (1 bedroom) Outside of Centre': 3,
        'Apartment (3 bedrooms) in City Centre': 3,
        'Apartment (3 bedrooms) Outside of Centre': 3,
      },
      'Buy Apartment Price': {
        'Price per Square Meter to Buy Apartment in City Centre': 3,
        'Price per Square Meter to Buy Apartment Outside of Centre': 3,
      },
      'Salaries And Financing': {
        'Average Monthly Net Salary (After Tax)': 3,
        'Mortgage Interest Rate in Percentages (%), Yearly, for 20 Years Fixed-Rate':
            3,
      }
    }
  ];
  int selectedCountryes = 0;
  bool compare = false;

  @override
  void initState() {
    // TODO: implement initState
    // coutriesList = [
    //   {'name': "Germany", 'selected': false},
    //   {'name': "Italy", 'selected': false},
    //   {'name': "United Kingdom", 'selected': false},
    //   {'name': "U SA", 'selected': false}
    // ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return compare
        ? Compare(comparingCountries: coutriesList)
        : CountrySelection(
            coutriesList: coutriesList,
            selectedCountryes: selectedCountryes,
            setCompare: () {
              setState(() {
                compare = true;
              });
            },
            selectCountry: (name, selected) {
              setState(() {
                if (selected) {
                  selectedCountryes--;
                } else {
                  selectedCountryes++;
                }
                print(coutriesList.map((e) {
                  if (e['name'] == name) {
                    e['selected'] = !e['selected'];
                    return e;
                  }
                  ;
                  return e;
                }));
              });
            });
  }
}

class CountrySelection extends StatelessWidget {
  List<Map> coutriesList;
  int selectedCountryes;
  Function selectCountry;
  Function setCompare;

  CountrySelection(
      {required this.coutriesList,
      required this.selectedCountryes,
      required this.setCompare,
      required this.selectCountry});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        padding: EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 5),
        child: Scaffold(
            body: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
              ListView.builder(
                shrinkWrap: true,
                itemCount: coutriesList.length,
                itemBuilder: ((context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: CountrySelectionCard(
                      countryName: coutriesList[index]['name'],
                      selected: coutriesList[index]['selected'],
                      selectedCountryes: selectedCountryes,
                      onClick: (name, selected) =>
                          {selectCountry(name, selected)},
                    ),
                  );
                }),
              ),
              selectedCountryes == 2
                  ? Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 16.0),
                      child: Center(
                        child: ElevatedButton(
                          onPressed: () {
                            setCompare();
                          },
                          child: const Text('Compare'),
                        ),
                      ),
                    )
                  : Container(color: Colors.white)
            ]))));
  }
}

class CountrySelectionCard extends StatelessWidget {
  String countryName;
  bool selected;
  int selectedCountryes;
  Function onClick;

  CountrySelectionCard(
      {required this.selected,
      required this.countryName,
      required this.selectedCountryes,
      required this.onClick});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          if (selectedCountryes < 2 || selected) onClick(countryName, selected);
        },
        child:
            (Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Container(
            // ignore: sort_child_properties_last
            child: Row(
              children: [
                Flexible(
                  child: Text(
                    countryName,
                    style: const TextStyle(
                        fontSize: 30,
                        fontFamily: "Alegreya Sans",
                        fontWeight: FontWeight.w300,
                        overflow: TextOverflow.visible),
                  ),
                ),
                const Icon(
                  Icons.info_outline,
                  color: Colors.grey,
                  size: 28.0,
                ),
              ],
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: selected
                  ? Color.fromARGB(255, 112, 85, 249)
                  : Color(0xFFEFEFEF),
            ),
            padding: EdgeInsets.all(25),
          ),
        ])));
  }
}

class Compare extends StatelessWidget {
  List<Map> comparingCountries;
  List<Map> selectedComparingCountries = [];
  Compare({
    super.key,
    required this.comparingCountries,
  }) {
    this.selectedComparingCountries =
        comparingCountries.where((country) => country['selected']).toList();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 10,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
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
                  selectedComparingCountries: selectedComparingCountries,
                  title: 'Restaurants'),
              ComparingPage(
                  selectedComparingCountries: selectedComparingCountries,
                  title: 'Markets'),
              ComparingPage(
                  selectedComparingCountries: selectedComparingCountries,
                  title: 'Transportation'),
              ComparingPage(
                  selectedComparingCountries: selectedComparingCountries,
                  title: 'Utilities (Monthly)'),
              ComparingPage(
                  selectedComparingCountries: selectedComparingCountries,
                  title: 'Sports And Leisure'),
              ComparingPage(
                  selectedComparingCountries: selectedComparingCountries,
                  title: 'Childcare'),
              ComparingPage(
                  selectedComparingCountries: selectedComparingCountries,
                  title: 'Clothing And Shoes'),
              ComparingPage(
                  selectedComparingCountries: selectedComparingCountries,
                  title: 'Rent Per Month'),
              ComparingPage(
                  selectedComparingCountries: selectedComparingCountries,
                  title: 'Buy Apartment Price'),
              ComparingPage(
                  selectedComparingCountries: selectedComparingCountries,
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
