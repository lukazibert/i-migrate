import 'package:get/get.dart';

class SelectionViewController extends GetxController {
  final isComparing = false.obs;

  startComparing() {
    isComparing(true);
    isComparing.refresh();
  }

  stopComparing() {
    isComparing(false);
    isComparing.refresh();
    clearSelectedValues();
  }
  // final selectionCoutries = [
  //   {"name": "Germany", "selected": false},
  //   {"name": "United Kingdom", "selected": false},
  //   {"name": "Slovenia", "selected": false}
  // ].obs;

  final selectionCoutries = <Map<String, dynamic>>[].obs;

  void onInit() {
    super.onInit();

    // Initialize the selectionCoutries data structure
    selectionCoutries.addAll([
      {"name": "Germany", "selected": false},
      {"name": "United Kingdom", "selected": false},
      {"name": "Slovenia", "selected": false}
    ]);
  }

  selectCountry(String countryName) {
    selectionCoutries.forEach((country) {
      if (country["name"] == countryName) {
        country["selected"] = !country["selected"];
        print(country["name"] + " " + country["selected"].toString());
      }
    });
    selectionCoutries.refresh();
  }

  clearSelectedValues() {
    selectionCoutries.forEach((country) {
      country["selected"] = false;
    });
    selectionCoutries.refresh();
  }

  showCopareButton() {
    bool show = false;
    selectionCoutries.forEach((country) {
      if (country["selected"] == true) {
        show = true;
      }
    });
    return show;
  }
}
