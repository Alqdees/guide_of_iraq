import 'dart:developer';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:guide_of_iraq/Control/AddEntriesController/AddEntriesController.dart';
import 'package:guide_of_iraq/Model/AddEntriesModel/AddEntriesModel.dart';
import '../Colors/ColorApp.dart';
import '../HomePage/HomePage.dart';

class AddEntries extends StatelessWidget {
  AddEntries({super.key});
  TextEditingController name = TextEditingController();
  TextEditingController number = TextEditingController();
  TextEditingController location = TextEditingController();
  TextEditingController type = TextEditingController();
  TextEditingController sp = TextEditingController();
  TextEditingController gover = TextEditingController();
  TextEditingController cv = TextEditingController();
  String? drop_location = 'المحافظة';

  String drop_jr = 'نوع التخصص';
  AddEntriesController p = Get.put(AddEntriesController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          textDirection: TextDirection.ltr,
          children: [
            Container(
              padding: const EdgeInsets.only(top: 40.0),
              height: 80.0,
              child: const Text(
                'صفحة مدير الادخال',
                style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: AutofillHints.birthdayDay),
              ),
            ),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      TextFieldCustom(
                        lable: 'name',
                        icon: Icons.person,
                        c: name,
                      ),
                      const SizedBox(
                        height: 4.0,
                      ),
                      TextFieldCustom(
                        lable: 'Phone',
                        icon: Icons.phone,
                        c: number,
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 120.0,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 4.0, vertical: 4.0),
                  decoration: BoxDecoration(
                    color: ColorApp.graylight, // Background color
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.black,
                      width: 0.8,
                    ),
                  ),
                  child: TextButton(
                    child: const Text("أختر صورة"),
                    onPressed: () {},
                    // style: ButtonStyle(backgroundColor: WidgetStateProperty<Color>()),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 22.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                DropdownExample(
                  name: drop_location,
                  dropdownItems: const [
                    'المحافظة',
                    'كركوك',
                    'بغداد',
                  ],
                ),
                DropdownExample(
                  name: 'المنطقة',
                  dropdownItems: const [
                    'المنطقة',
                    'كركوك',
                    'بغداد',
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 8.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                DropdownExample(
                  name: 'القسم',
                  dropdownItems: const [
                    'القسم',
                    'دكتور',
                    'صيدلي',
                  ],
                ),
                DropdownExample(
                  name: 'الاختصاص',
                  dropdownItems: const [
                    'الاختصاص',
                    'عيون',
                    'باطنية',
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 12.0,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              width: double.infinity,
              child: DropdownExample(
                name: drop_jr,
                dropdownItems: const [
                  'نوع التخصص',
                  'جراحة قلبية',
                  'كلى',
                ],
              ),
            ),
            const SizedBox(
              height: 12.0,
            ),
            TextFieldCustomCV(
              lable: 'CV',
              icon: Icons.info,
              text: cv,
            ),
            const SizedBox(
              height: 10.0,
            ),
            Container(
              height: 70.0,
              width: 100.0,
              padding:
                  const EdgeInsets.symmetric(vertical: 4.0, horizontal: 2.0),
              decoration: BoxDecoration(
                color: ColorApp.graylight, // Background color
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: ColorApp.graylight,
                  width: 0.8,
                ),
              ),
              // color: ColorApp.graylight,
              child: IconButton(
                onPressed: () {
                  p.addEntries(
                    {
                      "phone": number.text,
                      "location": name.text,
                      "section": name.text,
                      "specialization": drop_location,
                      "specialization_type": "Ahmed S Muhnood",
                      "governorate": drop_jr,
                      "info": cv.text,
                    },
                  ).then((v) {
                    print(v);
                  });
                },
                icon: const Column(
                  children: [
                    Icon(Icons.save),
                    Text('Save'),
                  ],
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}

class TextFieldCustom extends StatelessWidget {
  TextFieldCustom(
      {required this.lable, required this.icon, required this.c, super.key});
  String? lable;
  IconData? icon;
  TextEditingController c = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: TextFormField(
        controller: c,
        decoration: InputDecoration(
          filled: true,
          fillColor: ColorApp.graylight, // Background color
          hintText: lable!.tr,
          hintStyle: const TextStyle(color: Colors.black),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(8.0),
            ),
          ),
          labelText: lable!.tr,

          prefixIcon: Icon(
            icon,
            color: Colors.black,
          ),
          // border: OutlineInputBorder(),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black,
            ),
          ),
          labelStyle: const TextStyle(
            color: Colors.black,
            //  background: ,
          ),
        ),
      ),
    );
  }
}

class TextFieldCustomCV extends StatelessWidget {
  TextFieldCustomCV(
      {required this.lable, required this.icon, required this.text, super.key});
  String? lable;
  IconData? icon;
  TextEditingController text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: TextFormField(
        controller: text,
        maxLines: 10,
        keyboardType: TextInputType.multiline,
        decoration: InputDecoration(
          filled: true,
          fillColor: ColorApp.graylight, // Background color
          hintText: lable!.tr,
          hintStyle: const TextStyle(color: Colors.black),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(8.0),
            ),
          ),
          labelText: lable!.tr,

          prefixIcon: Icon(
            icon,
            color: Colors.black,
          ),
          // border: OutlineInputBorder(),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black,
            ),
          ),
          labelStyle: const TextStyle(
            color: Colors.black,
            //  background: ,
          ),
        ),
      ),
    );
  }
}
