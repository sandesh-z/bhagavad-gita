import 'package:bhagavad_gita/ui/pages/onboarding/get_started.dart';
import 'package:bhagavad_gita/ui/pages/onboarding/select_language.dart';
import 'package:bhagavad_gita/ui/res/assets.dart';
import 'package:bhagavad_gita/utils/utils.dart';
import 'package:flutter/material.dart';
import '../../widgets/dot_widget.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  PageController controller = PageController();
  int _currentPage = 0;

  //length of imagePaths, titles and subtitles should be equal
  final List<String> imagePaths = [
    Assets.intro1,
    Assets.intro2,
    Assets.intro3,
  ];
  final List<String> titles = [
    "Bhagavad Gita - Simplified",
    "Multi Language",
    "Audio Book",
  ];
  final List<String> subtitles = [
    "Read the gita anytime,\nwhenever you wish.",
    "It build in two langugages Hindi,\nEnglish with the best and\neasy translation",
    "You can listen the book in Hindi,\nEnglish while doing your work",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff16141C),
        body: PageView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: imagePaths.length,
          onPageChanged: (page) {
            setState(() {
              _currentPage = page;
            });
          },
          controller: controller,
          itemBuilder: (context, index) {
            return Pages(
              imagePath: imagePaths[index],
              title: titles[index],
              subTitle: subtitles[index],
              currentPage: _currentPage,
              length: imagePaths.length,
              controller: controller,
            );
          },
        ));
  }
}

///if [showControls] is null or true [controller], [currentPage] and [length] cannot  be null
class Pages extends StatelessWidget {
  final PageController? controller;
  final String imagePath;
  final String title;
  final String subTitle;
  final int? currentPage, length;
  final bool? showControls;
  const Pages(
      {super.key,
      required this.imagePath,
      required this.title,
      required this.subTitle,
      this.controller,
      this.currentPage,
      this.length,
      this.showControls = true})
      : assert((showControls == false) ^
            (controller != null && currentPage != null && length != null));
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(imagePath),
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    height: 1.3,
                    color: Colors.white),
              ),
              const SizedBox(height: 10.0),
              Text(
                subTitle,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 16,
                    height: 1.3,
                    color: Colors.white.withOpacity(.7)),
              ),
              const SizedBox(height: 68.0)
            ]),
      ),
      _controlsWidget(
          context: context,
          showControls: showControls,
          controller: controller,
          currentPage: currentPage ?? 1,
          length: length ?? 1)
    ]);
  }
}

Widget _controlsWidget(
    {required BuildContext context,
    required bool? showControls,
    required PageController? controller,
    required int currentPage,
    required int length}) {
  return Positioned.fill(
    bottom: 20,
    child: Align(
      alignment: Alignment.bottomCenter,
      child: showControls == false
          ? ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xffF9902D)),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (_) => const SelectLanguagePage());
                // Navigator.of(context).push(MaterialPageRoute(
                //     builder: (_) => const SelectLanguagePage()));
              },
              child: const Text(
                'Get Started',
                style: TextStyle(color: Colors.white),
              ))
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            CustomDiagonalSlideTransition(
                                child: const GetStartedPage()));
                      },
                      child: const Text(
                        "SKIP",
                        style: TextStyle(color: Colors.white),
                      )),
                  DotWidget(
                    activeIndex: currentPage,
                    length: length,
                  ),
                  InkWell(
                    onTap: () {
                      if (currentPage == length - 1) {
                        Navigator.push(
                            context,
                            CustomDiagonalSlideTransition(
                                child: const GetStartedPage()));
                      }
                      controller?.nextPage(
                          duration: const Duration(milliseconds: 700),
                          curve: Curves.easeOut);
                    },
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "NEXT",
                          style: TextStyle(color: Colors.white),
                        ),
                        Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                          size: 18,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
    ),
  );
}
