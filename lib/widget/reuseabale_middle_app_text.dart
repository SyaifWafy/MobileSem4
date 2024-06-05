import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Import GetX untuk navigasi

import 'reuseable_text.dart';

class MiddleAppText extends StatelessWidget {
  const MiddleAppText({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(top: size.height * 0.015),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppText(
            text: text,
            size: 19,
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
          GestureDetector(
            onTap: () {
              Get.toNamed('/wisata');
            },
            child: const AppText(
              text: "Selengkapnya",
              size: 14,
              color: Colors.deepPurpleAccent,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
