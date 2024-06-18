import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:guide_of_iraq/Model/ShowDataModel.dart';
import 'package:http/http.dart' as http;

class ShowDataController extends GetxController {
  var posts = <Data>[].obs;
  // List<Data> posts = [];
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchPosts();
    super.onInit();
  }

  void fetchPosts() async {
    try {
      var uri = Uri.parse('https://abbas.pointeam.org/api/client/show');

      var body = {'client_id': '1'};

      // var headers = {"content-type": "application/json"};

      final response = await http.post(uri, body: body);
      log('Response: ${response.body}');
      isLoading(true);

      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse = json.decode(response.body);

        posts.value = jsonResponse.entries.map((data) {
          return Data(
            id: data.value,
            userId: data.value,
            phone: data.value,
            location: data.value,
            section: data.value,
            specialization: data.value,
            specializationType: data.value,
            governorate: data.value,
            info: data.value,
            createdAt: data.value,
            updatedAt: data.value,
          );
        }).toList();
      } else {
        print('Error ${response.statusCode}: ${response.reasonPhrase}');
        Get.snackbar('Error', 'Failed to load posts');
      }
    } catch (e) {
      e.printError();
      // print('Exception: $');
      Get.snackbar('Error', 'Failed to load posts: $e');
    } finally {
      isLoading(false);
    }
  }
}
