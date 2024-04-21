import 'package:flutter/material.dart';

import '../constants/constants.dart';

class CustomMessageWidget extends StatelessWidget {
  const CustomMessageWidget({
    super.key,
    required this.text,
    required this.color,
    required this.bottomRight,
    required this.bottomLeft,
  });

  final String text;
  final Color color;
  final Radius bottomRight;
  final Radius bottomLeft;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: width(context) / 20,
        vertical: height(context) / 160,
      ),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.only(
          topRight: const Radius.circular(15),
          topLeft: const Radius.circular(15),
          bottomRight: bottomRight,
          bottomLeft: bottomLeft,
        ),
      ),
      child: RichText(
        textWidthBasis: TextWidthBasis.longestLine,
        text: TextSpan(
          text: text,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
    );
  }
}
