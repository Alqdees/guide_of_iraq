import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:guide_of_iraq/Control/ShowDataController.dart';
import 'package:guide_of_iraq/View/Colors/ColorApp.dart';

import 'CardHomePage.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ShowDataController>(
      init: ShowDataController(),
      builder: (c) {
        return Scaffold(
          body: SafeArea(
              child: Column(
            children: [
              const SizedBox(
                height: 10.0,
              ),
              Expanded(
                child: Row(
                  children: [
                    const SizedBox(
                      width: 18.0,
                    ),
                    Container(
                      // color: ColorApp.graylight,
                      decoration: BoxDecoration(
                        color: ColorApp.graylight, // Background color
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.black, // Border color
                          width: 1.0, // Border width
                        ),
                      ),
                      child: IconButton(
                        onPressed: () {},
                        iconSize: 35.0,
                        icon: const Icon(
                          Icons.notification_add,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 8.0,
                    ),
                    Expanded(
                      flex: 4,
                      child: TextFormField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: ColorApp.graylight, // Background color
                          hintText: 'Search'.tr,
                          hintStyle: const TextStyle(color: Colors.black),
                          border: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                          ),
                          labelText: "Search".tr,

                          prefixIcon: const Icon(
                            Icons.search,
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
                    ),
                    const SizedBox(
                      width: 8.0,
                    ),
                  ],
                ),
              ),
              // const SizedBox(
              //   height: 4.0,
              // ),
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(
                      width: 1.0,
                    ),
                    DropdownExample(
                      name: "Doctor",
                      dropdownItems: const [
                        'Lawer',
                        'Doctor',
                        'Pharmacal',
                      ],
                    ),
                    // const SizedBox(
                    //   width: 4.0,
                    // ),
                    DropdownExample(
                      name: "Eye surgery 1",
                      dropdownItems: const [
                        "Eye surgery 1",
                        "Eye surgery 2",
                        "Eye surgery 3",
                      ],
                    ),
                    // const SizedBox(
                    //   width: 4.0,
                    // ),
                    DropdownExample(
                      name: "Baghdad",
                      dropdownItems: const [
                        'Baghdad',
                        'Basra',
                        'Najaf',
                      ],
                    ),
                    const SizedBox(
                      width: 1.0,
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 8,
                child: ListView.builder(
                  itemCount: 15,
                  itemBuilder: (context, i) {
                    return CardHomePage();
                  },
                ),
              )
            ],
          )),
        );
      },
    );
  }
}

class DropdownExample extends StatefulWidget {
  DropdownExample({
    required this.name,
    required this.dropdownItems,
    this.flex,
    super.key,
  });
  String? name;
  List<String>? dropdownItems;
  int? flex;
  @override
  _DropdownExampleState createState() => _DropdownExampleState();
}

class _DropdownExampleState extends State<DropdownExample> {
  String? _selectedValue;

  List<String>? _dropdownItems;
  @override
  void initState() {
    super.initState();
    _selectedValue = widget.name;
    // Initialize state with the constructor parameter
    _dropdownItems = widget.dropdownItems;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6.0),
      decoration: BoxDecoration(
        color: ColorApp.graylight, // Background color
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.black,
          width: 0.8,
        ),
      ),
      child: DropdownButton<String>(
        dropdownColor: ColorApp.graylight,
        hint: Text(_selectedValue!),
        value: _selectedValue,
        items: _dropdownItems!.map((String item) {
          return DropdownMenuItem<String>(
            value: item,
            child: Text(item),
          );
        }).toList(),
        onChanged: (String? newValue) {
          setState(() {
            _selectedValue = newValue;
          });
        },
      ),
    );
  }
}
