import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ShowDataController extends GetxController {
  var isLoading = true.obs;
  int index = 1;
  Map<String, dynamic>? responsed;
  RxList e = [].obs;

  @override
  void onInit() {
    fetchPosts();
    // e.value = test;
    super.onInit();
  }

  Future fetchPosts() async {
    try {
      var uri = Uri.parse(
          'https://abbas.pointeam.org/api/client/show?client_id=$index');

      final response = await http.post(uri);

      isLoading(true);

      if (response.statusCode == 200) {
        responsed = json.decode(response.body);
        index++;
      } else {
        print('Error ${response.statusCode}: ${response.reasonPhrase}');
        Get.snackbar('Error', 'Failed to load posts');
        // return;
      }
    } catch (e) {
      print('Exception: $e');
      Get.snackbar('Error', 'Failed to load posts: $e');
      // return;
    } finally {
      isLoading(false);
    }
    e.add(responsed!);

    log('message eeeee  finalyyyyyyy $e');
  }
}
