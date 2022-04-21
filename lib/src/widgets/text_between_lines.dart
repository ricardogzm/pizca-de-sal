import 'package:flutter/material.dart';

class TextBetweenLines extends StatelessWidget {
  final String label;
  final double indent;
  final TextStyle? textStyle;

  // Implement constructor
  const TextBetweenLines({
    Key? key,
    required this.label,
    required this.indent,
    this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Divider(
          color: Colors.white,
          endIndent: indent,
        )),
        Text(label,
            style: textStyle ??
                const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.w500)),
        Expanded(child: Divider(color: Colors.white, indent: indent)),
      ],
    );
  }
}
