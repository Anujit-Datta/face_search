import 'package:flutter/material.dart';
import 'appbar_avatar.dart';
import 'gradient_text.dart';

AppBar commonAppBar() {
  return AppBar(
    automaticallyImplyLeading: false,
    title: const Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ProfileAvatar(),
        SizedBox(width: 5,),
        GradientText(
          text: 'FTD',
          size: 40,
          colors: [Color(0xff7697ec), Color(0xff93d5f1),],
        ),
      ],
    ),
    flexibleSpace: Container(
      decoration: const BoxDecoration(
        border: Border( // Add border to bottom
          bottom: BorderSide(
            color: Colors.black12, // Change color as desired
            width: 1.0, // Adjust thickness as needed
          ),
        ),
      ),
    ),
  );
}