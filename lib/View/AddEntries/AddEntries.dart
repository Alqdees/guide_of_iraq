import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../Colors/ColorApp.dart';

class AddEntries extends StatelessWidget {
  const AddEntries({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Column(
        textDirection: TextDirection.ltr,
        children: [
          const Expanded(
            flex: 1,
            child: Text('صفحة مدير الادخال'),
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
                      icon: Icons.person,
                    ),
                  ],
                ),
              ),
              Container(
                height: 120.0,
                width: 100.0,
                // padding: const EdgeInsets.symmetric(
                //   horizontal: 6.0,
                //   vertical: 6.0,
                // ),
                decoration: BoxDecoration(
                  color: ColorApp.graylight, // Background color
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: ColorApp.graylight,
                    width: 0.8,
                  ),
                ),
                child: TextButton(
                  child: const Text("أختر صورة"),
                  onPressed: () {},
                ),
              ),
            ],
          ),
          const Row(
            children: [],
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
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
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
