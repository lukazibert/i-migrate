import 'package:get/get.dart';
import 'package:i_migrate/controllers/InterviewController.dart';

final interviewController = Get.put(InterviewController());

class ProfileViewController extends GetxController {
  // final questionAndAnwser = <Map<String, String>>[].obs;
  // final questionAndAnwser = [
  //   {"question": "What country do you currently live in?", "anwser": ""},
  //   {"question": "What city do you live in?", "anwser": ""},
  //   {"question": "What is your proffesion?", "anwser": ""}
  // ].obs;

  final userData = <String, dynamic>{}.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    userData({
      "name": "",
      "email": "",
      "password": "",
      "questionAndAnwsers": "",
    });

    super.onInit();
  }

  updateUserData(Map<String, String> data) {
    userData(
      {
        ...userData,
        "name": data["name"],
        "email": data["email"],
        "password": data["password"],
      },
    );
    userData.refresh();

    interviewController.setName(data["name"] ?? "");
    print(userData);
  }

  updateAnwsers() {
    userData["questionAndAnwsers"] =
        interviewController.getQuestionAndAnwsers();
    userData.refresh();
    print(userData);
  }

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
