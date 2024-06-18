import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guide_of_iraq/Control/ShowDataController.dart';
import 'package:guide_of_iraq/main.dart';

import '../Colors/ColorApp.dart';

class CardHomePage extends StatelessWidget {
  CardHomePage({super.key});
  double? height;
  ShowDataController postData = Get.put(ShowDataController());
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;

    return Obx(
      () {
        if (postData.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return ListView.builder(
            itemCount: postData.posts.length,
            itemBuilder: (context, i) {
              return Padding(
                padding: const EdgeInsets.all(4.0),
                child: Container(
                  height: height! / 7,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 6.0, vertical: 6.0),
                  decoration: BoxDecoration(
                    color: Colors.white, // Background color
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: ColorApp.graylight,
                      width: 0.8,
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            // textDirection: TextDirection.rtl,
                            children: [
                              Row(
                                textDirection: TextDirection.rtl,
                                children: [
                                  Text(
                                    maxLines: 2,
                                    postData.posts[i].specialization.toString(),
                                    textDirection: TextDirection.rtl,
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              const Row(
                                textDirection: TextDirection.rtl,
                                children: [
                                  Text(
                                    'دكتوراه طب وجراحة عيون ',
                                    style: TextStyle(
                                      fontSize: 20,
                                      // fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              const Row(
                                textDirection: TextDirection.rtl,
                                children: [
                                  Icon(
                                    Icons.calendar_month,
                                    textDirection: TextDirection.rtl,
                                  ),
                                  Text(
                                    '9:00 am - 4:00 pm ',
                                    // textDirection: preferences!.getString("lang") == 'ar'
                                    //     ? TextDirection.ltr
                                    //     : TextDirection.rtl,
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: ColorApp.bluelight,
                                    ),
                                  ),
                                ],
                              ),
                              const Row(
                                textDirection: TextDirection.rtl,
                                children: [
                                  Icon(Icons.location_pin),
                                  Text(
                                    'بغداد - مدينة الصدر',
                                    textAlign: TextAlign.start,
                                    // textDirection: preferences!.getString("lang") == 'ar'
                                    //     ? TextDirection.ltr
                                    //     : TextDirection.rtl,
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: ColorApp.bluelight,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 2.0),
                          decoration: BoxDecoration(
                            color: Colors.white, // Background color
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: ColorApp.graylight,
                              width: 0.8,
                            ),
                          ),
                          child: Image.asset(
                            'assets/images/doctor.png',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        }
      },
    );
  }
}
