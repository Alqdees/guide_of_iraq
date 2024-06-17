import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:guide_of_iraq/Model/ShowDataModel.dart';
import 'package:http/http.dart' as http;

class ShowDataController extends GetxController {
  var posts = <ShowDataModel>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchPosts();
    super.onInit();
  }

  void fetchPosts() async {
    try {
      isLoading(true);
      final responsed = await http.get(
        Uri.parse(
          'https://abbas.pointeam.org/api/client/show',
        ),
      );
      if (responsed.statusCode == 200) {
        List jsonResponsed = json.decode(
          responsed.body,
        );
        posts.value = jsonResponsed
            .map((
              post,
            ) =>
                ShowDataModel.fromJson(post))
            .toList();
        log(
          'message_-_--_-___  ${posts.value}',
        );
      } else {
        Get.snackbar('Error', 'Failed to load posts');
        log('Error Post ${responsed.statusCode}');
      }
    } finally {
      isLoading(false);
    }
  }
}
