import 'package:flutter/material.dart';

class SelectionView extends StatefulWidget {
  SelectionView({
    super.key,
  });

  @override
  State<SelectionView> createState() => _SelectionViewState();
}

class _SelectionViewState extends State<SelectionView> {
  List<String> coutriesList = [];

  @override
  void initState() {
    // TODO: implement initState
    coutriesList = ["Germany", "Italy", "United Kingdom", "USA"];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 5),
      child: ListView.builder(
        itemCount: coutriesList.length,
        // padding: EdgeInsets.symmetric(vertical:.0),
        itemBuilder: ((context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: CountrySelectionCard(
              countryName: coutriesList[index],
              onClick: () => {},
            ),
          );
        }),
      ),
    );
  }
}

class CountrySelectionCard extends StatelessWidget {
  String countryName;
  Function onClick;

  CountrySelectionCard({required this.countryName, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Flexible(
            child: Text(
              countryName,
              style: TextStyle(
                  fontSize: 30,
                  fontFamily: "Alegreya Sans",
                  fontWeight: FontWeight.w300,
                  overflow: TextOverflow.visible),
            ),
          ),
          Icon(
            Icons.info_outline,
            color: Colors.grey,
            size: 28.0,
          ),
        ],
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Color(0xFFEFEFEF),
      ),
      padding: EdgeInsets.all(25),
    );
  }
}
