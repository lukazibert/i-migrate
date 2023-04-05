import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_migrate/controllers/ProfileViewController.dart';
import 'package:i_migrate/views/ProfileView.dart';
// import 'package:http/http.dart' as http;

final profileController = Get.put(ProfileViewController());

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
        "anwser": "",
        "informatio":
            "Collecting the user's name is crucial for personalizing the app's communication and providing a more personalized experience. It also helps in identifying the user in case of any follow-up communication or documentation.",
        "lable": "Name"
      },
      {
        "question": "What country do you currently live in?",
        "questionType": "dropdown",
        "options": ["Canada", "USA", "Mexico", "Brazil", "Argentina"],
        "anwser": "",
        "informatio":
            "Knowing the country of residence is crucial for understanding the user's current legal and geographical context. This information is particularly important in the migration and visa application process, as different countries have different laws and requirements."
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
        ],
        "anwser": "",
        "information":
            "Collecting the city of residence helps in providing more accurate and relevant information to the user, particularly in terms of local laws, regulations, and procedures. It can also help in identifying nearby resources that may be relevant to the user's migration or visa application process."
      },
      {
        "question": "How old are you?",
        "questionType": "textInput",
        "anwser": "",
        "information":
            "Knowing the user's age is important for identifying any age-specific requirements or restrictions that may apply to the user's migration or visa application process. For example, certain visas may require applicants to be above a certain age or may have age-specific eligibility criteria.",
        "lable": "Age"
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
        "anwser": "",
        "information":
            "Collecting information about the user's profession can help in identifying relevant visa or migration options that may be available to them. It can also help in understanding the user's skillset, qualifications, and experience, which may be relevant to the migration or visa application process."
      },
      {
        "question": "Do you have any children?",
        "questionType": "multipleChoice",
        "options": ["Yes", "No"],
        "anwser": "",
        "information":
            "Knowing whether the user has children is important for identifying any family-related migration or visa options that may be available to them. It can also help in understanding the user's family situation, which may be relevant to the migration or visa application process."
      },
    ]);
    // List temp = await getCountries();
    // temp.map((country) => countries.add(country)).toList();
    // // countries.add(temp);?
    // print(countries.toString());

    super.onInit();
  }

  setAnwser(int index, String anwser) {
    interviewQuestions[index]["anwser"] == anwser
        ? {interviewQuestions[index]["anwser"] = "", dataEntered(false)}
        : {interviewQuestions[index]["anwser"] = anwser, dataEntered(true)};

    interviewQuestions.refresh();
  }

  getQuestionAndAnwsers() {
    List<Map<String, dynamic>> temp = [];
    interviewQuestions.forEach((element) {
      if (element["anwser"] != "") {
        temp.add({
          "question": element["question"],
          "anwser": element["anwser"],
        });
      }
    });
    return temp;
  }

  setName(String name) {
    interviewQuestions[0]["anwser"] = name;
    interviewQuestions.refresh();
  }

  updateAnwsers() {
    profileController.updateAnwsers();
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
