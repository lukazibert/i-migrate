import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:http/http.dart' as http;

class InterviewController extends GetxController {
  // final _interviews = <Interview>[].obs;
  // List<Interview> get interviews => _interviews;

  // @override
  // void onInit() {
  //   super.onInit();
  //   _interviews.bindStream(InterviewService().interviews);
  // }

  final interviewQuestions = <Map<String, dynamic>>[].obs;

  final pageController = PageController(initialPage: 0).obs;

  final countries = <String>[].obs;

  setDataEntered(bool value) {
    dataEntered(value);
  }

  final dataEntered = false.obs;

  @override
  void onInit() async {
    // TODO: implement onInit
    interviewQuestions([
      {
        "question": "What is your name?",
        "questionType": "textInput",
      },
      {
        "question": "What country do you currently live in?",
        "questionType": "dropdown",
        "options": ["Canada", "USA", "Mexico", "Brazil", "Argentina"]
      },
      {
        "question": "What city do you live in?",
        "questionType": "dropdown",
        "options": [
          "Toronto",
          "Vancouver",
          "Montreal",
          "Ottawa",
          "Calgary",
          "Edmonton",
          "Winnipeg",
          "Quebec City",
          "Hamilton",
          "Kitchener",
          "London",
          "Victoria",
          "Halifax",
          "St. John's",
          "Regina",
          "Saskatoon",
          "Windsor",
          "Oshawa",
          "Barrie",
          "Sherbrooke",
          "Guelph",
          "Kingston",
          "Trois-Rivières",
          "Moncton",
          "Saint John",
          "Abbotsford",
          "Saint John",
          "Sal"
        ]
      },
      {
        "question": "What is your proffesion?",
        "questionType": "multipleChoiceWrap",
        "options": [
          "Accountant",
          "Actor",
          "Administrator",
          "Advertising executive",
          "Architect",
          "Artist",
          "Attorney",
          "Banker",
          "Business analyst",
          "Chef",
          "Civil engineer",
          "Computer programmer",
          "Consultant",
          "Dentist",
          "Designer",
          "Doctor",
          "Economist",
          "Event planner",
          "Financial analyst",
          "Graphic designer",
          "Human resources manager",
          "Insurance agent",
          "Interior designer",
          "Journalist",
          "Law enforcement officer",
          "Lawyer",
          "Manager",
        ],
        "selectedIndex": null
      }
    ]);
    // List temp = await getCountries();
    // temp.map((country) => countries.add(country)).toList();
    // // countries.add(temp);?
    // print(countries.toString());

    super.onInit();
  }

  setSelectedIndex(int index, int selectedIndex) {
    interviewQuestions[index]["selectedIndex"](selectedIndex);
  }

  // Future<List<dynamic>> getCountries() async {
  //   final response = await http
  //       .get(Uri.parse('https://countriesnow.space/api/v0.1/countries'));

  //   if (response.statusCode == 200) {
  //     final data = json.decode(response.body);
  //     final List<dynamic> countriesData = data['data'];
  //     // print(countriesData.toString());
  //     final List countries =
  //         countriesData.map((countryData) => countryData["country"]).toList();
  //     return countries;
  //   } else {
  //     throw Exception('Failed to fetch countries from API');
  //   }
  // }
}
