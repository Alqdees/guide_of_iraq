import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:guide_of_iraq/Model/ShowDataModel.dart';
import 'package:http/http.dart' as http;

class ShowDataController extends GetxController {
  List<Data> person = [];
  // RxList posts = <Data>[].obs;
  var isLoading = true.obs;
  int index = 1;
  Map<String, dynamic>? responsed;

  @override
  void onInit() {
    fetchPosts();
    super.onInit();
  }

  void fetchPosts() async {
    try {
      var uri = Uri.parse('https://abbas.pointeam.org/api/client/show');

      var body = {'client_id': index.toString()};

      // var headers = {"content-type": "application/json"};

      final response = await http.post(uri, body: body);

      isLoading(true);

      if (response.statusCode == 200) {
        responsed = json.decode(response.body);
        log('message  === ${responsed!.values.toList()}');
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
