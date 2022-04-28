import 'package:flutter/material.dart';

class TextBetweenLines extends StatelessWidget {
  final String label;
  final double indent;
  final TextStyle? textStyle;
  final Color lineColor;

  // Implement constructor
  const TextBetweenLines({
    Key? key,
    required this.label,
    required this.indent,
    this.textStyle,
    this.lineColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Divider(
          color: lineColor,
          endIndent: indent,
        )),
        Text(label,
            style: textStyle ??
                const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.w500)),
        Expanded(child: Divider(color: lineColor, indent: indent)),
      ],
    );
  }
}
