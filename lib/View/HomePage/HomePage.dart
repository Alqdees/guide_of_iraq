import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guide_of_iraq/Control/ShowDataController.dart';
import 'package:guide_of_iraq/View/AddEntries/AddEntries.dart';
import 'package:guide_of_iraq/View/Colors/ColorApp.dart';

import 'CardHomePage.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  ShowDataController postData = Get.put(ShowDataController());
  double? height;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: ColorApp.grayvertlight,
      // bottomSheet:
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
                  padding: const EdgeInsets.symmetric(
                      vertical: 4.0, horizontal: 2.0),
                  decoration: BoxDecoration(
                    color: ColorApp.graylight, // Background color
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: ColorApp.graylight,
                      width: 0.8,
                    ),
                  ),
                  child: IconButton(
                    onPressed: () {},
                    iconSize: 34.0,
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
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
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
            child: Obx(() {
              if (postData.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return ListView.builder(
                  itemCount: 8, //postData.index,
                  itemBuilder: (context, i) {
                    // postData.fetchPosts();
                    // print('object111 $i');
                    return CardHomePage(
                      name: postData.responsed!.values.toList()[7].toString(),
                      time: postData.responsed!.values.toList()[2].toString(),
                      type: postData.responsed!.values.toList()[5].toString(),
                      h: height,
                    );
                  },
                );
              }
            }),
          ),
          Container(
            color: ColorApp.grayvertlight,
            height: 70.0,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                    onPressed: () {},
                    icon: const Column(
                      children: [
                        Icon(
                          Icons.home,
                          color: Colors.black,
                          size: 34.0,
                        ),
                        Text('Home')
                      ],
                    )),
                IconButton(
                  onPressed: () {
                    // Get.offNamed(const AddEntries().toString());
                    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                      return const AddEntries();
                    }));
                  },
                  icon: const Column(
                    children: [
                      Icon(
                        Icons.save,
                        color: Colors.black,
                        size: 32.0,
                      ),
                      Text("Saving"),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Column(
                    children: [
                      Icon(
                        Icons.settings,
                        color: Colors.black,
                        size: 32.0,
                      ),
                      Text('settings'),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Column(
                    children: [
                      Icon(
                        Icons.branding_watermark,
                        color: Colors.black,
                        size: 32.0,
                      ),
                      Text('sections'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}

class DropdownExample extends StatefulWidget {
  DropdownExample({
    required this.name,
    required this.dropdownItems,
    super.key,
  });
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
            print('object $_selectedValue');
          });
        },
      ),
    );
  }
}
