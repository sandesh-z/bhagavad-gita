import 'package:flutter/material.dart';

import '../../widgets/radio_buttons.dart';

class SetttingsPage extends StatelessWidget {
  const SetttingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Settings"),
        centerTitle: true,
      ),
      body: const Column(
        children: [
          SetingItem(
              title: "Language",
              firstItem: "English",
              secondItem: "Hindi",
              isLanguage: true),
          SizedBox(height: 20.0),
          SetingItem(
              title: "Audio feature", firstItem: "off", secondItem: "on"),
        ],
      ),
    );
  }
}

class SetingItem extends StatelessWidget {
  final String title, firstItem, secondItem;
  final bool? isLanguage;
  const SetingItem(
      {super.key,
      required this.title,
      required this.firstItem,
      required this.secondItem,
      this.isLanguage = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          width: double.infinity,
          color: const Color(0xffF9902D),
          child: Text(title),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: RadioButtons(
              firstItem: firstItem,
              secondItem: secondItem,
              isLanguage: isLanguage),
        )
      ],
    );
  }
}
