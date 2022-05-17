import 'package:flutter/material.dart';

class TitledSection extends StatelessWidget {
  const TitledSection({required this.title, required this.child, Key? key})
      : super(key: key);

  final String title;

  /// Child should probably be a SizedBox
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: Theme.of(context).textTheme.headline3),
        const SizedBox(height: 16),
        child,
      ],
    );
  }
}
