import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../Colors/ColorApp.dart';
import '../HomePage/HomePage.dart';

class AddEntries extends StatelessWidget {
  const AddEntries({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
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
                    ),
                    const SizedBox(
                      height: 4.0,
                    ),
                    TextFieldCustom(
                      lable: 'Phone',
                      icon: Icons.phone,
                    ),
                  ],
                ),
              ),
              Container(
                height: 120.0,
                padding:
                    const EdgeInsets.symmetric(horizontal: 4.0, vertical: 4.0),
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
                name: 'المحافظة',
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
                name: 'المحافظة',
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
            height: 12.0,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            width: double.infinity,
            child: DropdownExample(
              name: 'نوع التخصص',
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
          Expanded(child: TextFieldCustomCV(lable: 'CV', icon: Icons.info)),
          const SizedBox(
            height: 32.0,
          ),
          Expanded(
            child: Container(
              color: ColorApp.graylight,
              
              child: IconButton(
                onPressed: () {},
                icon: const Column(
                  children: [
                    Icon(Icons.save),
                    Text('Save'),
                  ],
                ),
              ),
            ),
          )
        ],
      )),
    );
  }
}

class TextFieldCustom extends StatelessWidget {
  TextFieldCustom({required this.lable, required this.icon, super.key});
  String? lable;
  IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: TextFormField(
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
  TextFieldCustomCV({required this.lable, required this.icon, super.key});
  String? lable;
  IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: TextFormField(
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
