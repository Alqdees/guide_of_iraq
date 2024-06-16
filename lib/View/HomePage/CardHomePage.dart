import 'package:flutter/material.dart';

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
        height: height! / 6,
        padding: const EdgeInsets.symmetric(horizontal: 6.0),
        decoration: BoxDecoration(
          color: Colors.white, // Background color
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: ColorApp.graylight,
            width: 0.8,
          ),
        ),
        child: const Row(
          children: [
            Column(
              children: [],
            ),
            Icon(Icons.abc)
          ],
        ),
      ),
    );
  }
}
