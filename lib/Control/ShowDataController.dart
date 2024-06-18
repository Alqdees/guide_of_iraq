import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:guide_of_iraq/Model/ShowDataModel.dart';
import 'package:http/http.dart' as http;

class ShowDataController extends GetxController {
  var posts = <Data>[].obs;
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

      isLoading(true);

      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse = json.decode(response.body);
        posts.value = jsonResponse.entries.map((data) {
          return Data.fromJson(jsonResponse);
        }).toList();
        // posts.value = jsonResponse.entries.map((data) {
        //   return (
        //     id: int.parse(data.key),
        //     userId: int.parse(data.key),
        //     phone: data.key,
        //     location: data.key,
        //     section: data.key,
        //     specialization: data.key,
        //     specializationType: data.key,
        //     governorate: data.key,
        //     info: data.key,
        //     createdAt: data.key,
        //     updatedAt: data.key,
        //   );
        // }).toList();
        print(posts.length);
        // log('message: ${posts.value} :');

        // jsonResponse.forEach(
        //   (key, value) {

        //     // posts.value[key] = value;
        //   },
        // );

        // posts.value = jsonResponse
        //     .map(
        //       (post) => ShowDataModel.fromJson(post),
        //     )
        //     .toList();
      } else {
        print('Error ${response.statusCode}: ${response.reasonPhrase}');
        Get.snackbar('Error', 'Failed to load posts');
      }
    } catch (e) {
      print('Exception: $e');
      Get.snackbar('Error', 'Failed to load posts: $e');
    } finally {
      isLoading(false);
    }
  }
}
