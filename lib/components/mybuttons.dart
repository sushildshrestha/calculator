import 'package:flutter/material.dart';

class MyButtons extends StatelessWidget {
  const MyButtons(
      {super.key, this.textColor, required this.buttonText, this.color});
  final color;
  final String buttonText;
  final textColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(21),
        child: Container(
            // margin: const EdgeInsets.symmetric(horizontal: 8),
            color: color,
            child: Center(
                child: Text(
              buttonText,
              style: TextStyle(
                color: textColor,
                fontSize: 22,
              ),
            ))),
      ),
    );
  }
}
