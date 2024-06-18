import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guide_of_iraq/Services/Language/LanguagesController.dart';
import 'package:guide_of_iraq/Services/Language/Locale.dart';
import 'package:guide_of_iraq/View/AddEntries/AddEntries.dart';
import 'package:guide_of_iraq/View/HomePage/HomePage.dart';
import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences? preferences;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // sharep = await SharedPreferences.getInstance();
  preferences = await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    LanguagesController lang = Get.put(LanguagesController());

    return GetMaterialApp(
      locale: lang.language,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      translations: Languages(),

      // theme: ThemeData(
      //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      //   useMaterial3: true,
      // ),
      home:  HomePage(),
    );
  }
}
