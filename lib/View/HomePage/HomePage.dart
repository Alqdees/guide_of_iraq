import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:guide_of_iraq/Control/ShowDataController.dart';
import 'package:guide_of_iraq/View/Colors/ColorApp.dart';

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
                      width: 8.0,
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
              const SizedBox(
                height: 8.0,
              ),
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(
                      height: 4.0,
                    ),
                    DropdownExample(
                      name: "Doctor",
                      dropdownItems: const [
                        'Lawer',
                        'Doctor',
                        'Pharmacal',
                      ],
                    ),
                    DropdownExample(
                      name: "Eye surgery",
                      dropdownItems: const [
                        "Eye surgery",
                      ],
                    ),
                    DropdownExample(
                      name: "Baghdad",
                      dropdownItems: const [
                        'Baghdad',
                      ],
                    ),
                    const SizedBox(
                      height: 4.0,
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 8,
                child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, i) {
                    return const ListTile(
                      leading: Text(
                        'Ali',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      title: Icon(Icons.safety_check),
                    );
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
  DropdownExample({required this.name, required this.dropdownItems, super.key});
  String? name;
  List<String>? dropdownItems;
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
      padding: const EdgeInsets.all(4.0),
      decoration: BoxDecoration(
        color: ColorApp.graylight, // Background color
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: Colors.black, width: 2),
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
