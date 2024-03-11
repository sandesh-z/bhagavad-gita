import 'package:bhagavad_gita/ui/pages/home/home.dart';
import 'package:flutter/material.dart';

import '../../res/assets.dart';
import '../../widgets/radio_buttons.dart';

class SelectLanguagePage extends StatefulWidget {
  const SelectLanguagePage({super.key});

  @override
  State<SelectLanguagePage> createState() => _SelectLanguagePageState();
}

class _SelectLanguagePageState extends State<SelectLanguagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff16141C),
      body: Center(
        child: Material(
          color: Colors.transparent,
          child: Stack(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 40.0, vertical: 20.0),
                decoration: BoxDecoration(
                    color: const Color(0xfffbdcb2),
                    borderRadius: BorderRadius.circular(9),
                    border: Border.all(width: 1, color: Colors.white)),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      Assets.languageIcon,
                      height: 100.0,
                      width: 80.0,
                    ),
                    const SizedBox(height: 20.0),
                    const Text(
                      "Choose your preferred\nlanguage",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    const Text(
                      "(Don't worry you can change it later)",
                      textAlign: TextAlign.center,
                    ),
                    const RadioButtons(
                      firstItem: "English",
                      secondItem: "Hindi",
                      isLanguage: true,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xffF9902D)),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => const HomePage()));
                      },
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Ok, Let's go",
                            style: TextStyle(color: Colors.white),
                          ),
                          SizedBox(width: 5.0),
                          Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                            size: 14,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Positioned.fill(
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: Image.asset(Assets.topLeftCornerSprite))),
              Positioned.fill(
                  child: Align(
                alignment: Alignment.bottomRight,
                child: Image.asset(Assets.bottomRightCornerSprite),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
