import 'package:get/get.dart';
import 'package:guide_of_iraq/Model/AddEntriesModel/AddEntriesModel.dart';

class AddEntriesController extends GetxController {
  AddEntriesModel? add;

  @override
  void onInit() {
    add = AddEntriesModel();
    // TODO: implement onInit
    super.onInit();
  }

  Future<bool> addEntries(Map<String, dynamic> entries) async {
    if (await add!.addEntries(entries)) {
      Get.snackbar('title', 'Done Added');
      update();
      return true;
    }
    Get.snackbar('title', 'Field Added');
    update();
    return false;
  }
}
