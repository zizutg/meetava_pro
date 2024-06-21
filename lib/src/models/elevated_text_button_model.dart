import 'package:flutter/widgets.dart';

class ElevetedTextButtonModel {
  final String text;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color borderColor;
  final Color textColor;
  final double borderWidth;
  final double borderRadius;

  ElevetedTextButtonModel({
    required this.text,
    required this.onPressed,
    required this.backgroundColor,
    required this.borderColor,
    required this.textColor,
    required this.borderWidth,
    required this.borderRadius,
  });
}
