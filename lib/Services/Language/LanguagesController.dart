

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guide_of_iraq/main.dart';

class LanguagesController extends GetxController {
  Locale language = preferences!.getString("lang") == null
      ? const Locale('en')
      : Locale(
          preferences!.getString("lang")!,
        );

  void changeLanguage(String? language) {
    Locale lang = Locale(language ?? "en");
    preferences!.setString("lang", language!);
    Get.updateLocale(lang);
  }


}