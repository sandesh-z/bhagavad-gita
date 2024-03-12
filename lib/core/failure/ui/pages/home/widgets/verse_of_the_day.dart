import 'package:bhagavad_gita/utils/utils.dart';
import 'package:flutter/material.dart';

import '../../../../utils/assets.dart';
import '../../../../utils/colors.dart';

class VerseOfTheDay extends StatelessWidget {
  const VerseOfTheDay({super.key});

  @override
  Widget build(BuildContext context) {
    String test =
        "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like";
    return Column(
      children: [
        Stack(
          children: [
            SizedBox(
                height: 194,
                child: Image.asset(
                  Assets.verseOfTheDayBackgournd,
                  width: double.infinity,
                  fit: BoxFit.cover,
                )),
            Transform.translate(
              offset: const Offset(0, 60),
              child: Container(
                height: 161.0,
                margin: const EdgeInsets.symmetric(horizontal: 25.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Stack(
                    children: [
                      Image.asset(
                        Assets.verseOfTheDayForeground,
                        width: double.infinity,
                        fit: BoxFit.fill,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(12.0, 12, 0, 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "VERSE OF THE DAY",
                              style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                  color: Palette.primary),
                            ),
                            const SizedBox(height: 5.0),
                            Text(
                              truncateWithEllipsis(test, 20),
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                                height: 1.1,
                              ),
                              overflow: TextOverflow.visible,
                              maxLines: 4,
                            ),
                            const SizedBox(height: 10.0),
                            InkWell(
                              onTap: () {
                                //
                              },
                              child: const Text(
                                " READ MORE",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 60)
      ],
    );
  }
}
