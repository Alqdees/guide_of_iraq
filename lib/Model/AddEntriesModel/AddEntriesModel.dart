import 'dart:convert';
import 'package:http/http.dart' as http;

class AddEntriesModel {
   final url = Uri.parse('https://abbas.pointeam.org/api/client/create');

   Future<bool> addEntries(Map<String, dynamic> entries) async {
    // Send the PATCH request

    final response = await http.post(
      url,
      body: entries,
    );

    // Check the status code and print the response
    if (response.statusCode == 200) {
      final Map<String, dynamic> parsed = json.decode(response.body);
      if (parsed['status'] == true) {
        return true;
        // print(' ++++++++++  ---${parsed['status']}');
      } else {
        print('object -- ${parsed['status']}');
      }
      print('Data patched successfully: ${response.body}');
    } else {
      print('Failed to patch data: ${response.statusCode}');
    }
    return false;
  }
}
