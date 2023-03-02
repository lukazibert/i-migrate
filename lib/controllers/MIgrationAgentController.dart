import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class MigrationAgentCOntroller extends GetxController {
  // coutryId or name
  final coutryId = 0.obs;

  setCoutryId(int index) => coutryId(index);

  final data = [].obs;

  getData(int coutryId) {
    // retrive data from firestore
  }
}
