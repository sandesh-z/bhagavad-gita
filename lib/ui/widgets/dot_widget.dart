import 'package:flutter/material.dart';

class DotWidget extends StatefulWidget {
  final int activeIndex;
  final int length;
  const DotWidget({super.key, required this.activeIndex, required this.length});

  @override
  State<DotWidget> createState() => _DotWidgetState();
}

class _DotWidgetState extends State<DotWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ...List<Widget>.generate(
          widget.length,
          (index) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: Container(
              height: 8,
              width: index == widget.activeIndex ? 15 : 8,
              decoration: index == widget.activeIndex
                  ? BoxDecoration(
                      color: const Color(0xffF9902D),
                      borderRadius: BorderRadius.circular(9))
                  : BoxDecoration(
                      color: const Color(0xffF9902D).withOpacity(.6),
                      shape: BoxShape.circle),
            ),
          ),
        ),
      ],
    );
  }
}
