import 'package:get/get.dart';

class ProfileViewController extends GetxController {
  // final questionAndAnwser = <Map<String, String>>[].obs;
  final questionAndAnwser = [
    {"question": "What country do you currently live in?", "anwser": "India"},
    {"question": "What city do you live in?", "anwser": "Mumbai"},
    {"question": "What is your proffesion?", "anwser": "Softwear developer"}
  ].obs;

//   void onInit() {
//     super.onInit();

//     getData();
//   }

// // Make request to the DB
//   getData() {
//     // Initialize the selectionCoutries data structure
//     // questionAndAnwser.addAll([
//     //   {"question": "What country do you currently live in?", "anwser": "India"},
//     //   {"question": "What city do you live in?", "anwser": "Mumbai"},
//     //   {"question": "What is your proffesion?", "anwser": "Softwear developer"}
//     // ]);
//   }
}
