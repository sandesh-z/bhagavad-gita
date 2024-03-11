import 'package:flutter/material.dart';

class RadioButtons extends StatefulWidget {
  final bool? isLanguage;
  final String firstItem, secondItem;
  const RadioButtons(
      {super.key,
      required this.firstItem,
      required this.secondItem,
      this.isLanguage = false});

  @override
  State<RadioButtons> createState() => _RadioButtonsState();
}

class _RadioButtonsState extends State<RadioButtons> {
  int selectedOption = 1;

  var fillColor =
      MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
    return const Color(0xfffeb556);
  });

  var activeColor = const Color(0xffF9902D);
  @override
  Widget build(BuildContext context) {
    var textStyle = TextStyle(
        fontWeight:
            (selectedOption == 2) ? FontWeight.bold : FontWeight.normal);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 10.0),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 30,
              child: Radio<int>(
                value: 1,
                groupValue: selectedOption,
                activeColor: activeColor,
                fillColor: fillColor,
                onChanged: (value) {
                  setState(() {
                    selectedOption = value ?? 1;
                    // _value = value ?? 1;
                  });
                },
              ),
            ),
            const SizedBox(width: 5.0),
            Text(widget.firstItem,
                style: TextStyle(
                    fontWeight: (selectedOption == 1)
                        ? FontWeight.bold
                        : FontWeight.normal)),
          ],
        ),
        Row(mainAxisSize: MainAxisSize.min, children: [
          SizedBox(
            height: 30,
            child: Radio<int>(
              value: 2,
              groupValue: selectedOption,
              activeColor: activeColor,
              fillColor: fillColor,
              onChanged: (value) {
                setState(() {
                  selectedOption = value ?? 1;
                });
              },
            ),
          ),
          const SizedBox(width: 5.0),
          widget.isLanguage == true
              ? Text("${widget.secondItem}   ", style: textStyle)
              : Text(widget.secondItem, style: textStyle),
        ]),
        const SizedBox(height: 20.0),
      ],
    );
  }
}
