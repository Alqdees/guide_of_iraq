import 'package:flutter/material.dart';
import 'package:guide_of_iraq/main.dart';

import '../Colors/ColorApp.dart';

class CardHomePage extends StatelessWidget {
  CardHomePage({super.key});
  double? height;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        height: height! / 7,
        padding: const EdgeInsets.symmetric(horizontal: 6.0),
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
            const Expanded(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                // textDirection: TextDirection.rtl,
                children: [
                  Text(
                    'د. احمد فهدي ',
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'دكتوراه طب وجراحة عيون ',
                    style: TextStyle(
                      fontSize: 20,
                      // fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    textDirection: TextDirection.rtl,
                    children: [
                      Icon(
                        Icons.calendar_month,
                        textDirection: TextDirection.rtl,
                      ),
                      Text(
                        'دكتوراه طب وجراحة عيون ',
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
                  Row(
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
            Expanded(
              flex: 1,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 2.0),
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
  }
}
