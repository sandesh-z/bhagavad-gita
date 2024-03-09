import 'package:bhagavad_gita/ui/pages/onboarding/intro.dart';
import 'package:flutter/material.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xff16141C),
      body: Pages(
          showControls: false,
          imagePath: "assets/images/intro4.png",
          title: "Let's start",
          subTitle: "Start app and enjoy it"),
    );
  }
}
