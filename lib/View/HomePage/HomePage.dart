import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guide_of_iraq/Control/ShowDataController.dart';

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
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: IconButton(
                        onPressed: () {},
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
                      child: TextFormField(),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: OutlinedButton(
                        onPressed: () {},
                        child: const Text('data'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: OutlinedButton(
                        onPressed: () {},
                        child: const Text('data'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: OutlinedButton(
                        onPressed: () {},
                        child: const Text('data'),
                      ),
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
