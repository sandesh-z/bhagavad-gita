import 'package:bhagavad_gita/utils/utils.dart';
import 'package:flutter/material.dart';

class LastRead extends StatelessWidget {
  const LastRead({super.key});

  @override
  Widget build(BuildContext context) {
    String test =
        "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like";
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Last read",
                style: TextStyle(
                    fontSize: 18.0,
                    color: Color(0xff627485),
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "VERSE 7.27",
                style: TextStyle(
                  color: Color(0xff627485),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10.0),
          Text(
            truncateWithEllipsis(test, 25),
          ),
          const SizedBox(
            height: 10.0,
          ),
          const InkWell(
              child: Text(
            "CONTINUE READING",
            style: TextStyle(color: Color(0xffF9902D)),
          )),
          const SizedBox(height: 20.0),
        ],
      ),
    );
  }
}
