import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final TextStyle? style;

  const CustomText({
    super.key,
    required this.text,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      text,
      style:  style,
      textDirection: TextDirection.ltr,
      
    );
  }
}
