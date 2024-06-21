import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:meetava_pro/src/src.dart';
import 'package:meetava_pro/src/util/constants.dart';
import '../src.dart';

class ElevetedTextButtonModel {
  final String text;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color borderColor;
  final Color textColor;
  final EdgeInsetsGeometry padding;
  final double borderWidth;
  final double borderRadius;

  ElevetedTextButtonModel({
    required this.text,
    required this.onPressed,
    this.backgroundColor = Colors.transparent,
    this.borderColor = Colors.transparent,
    this.textColor = Colors.transparent,
    this.padding = AppPadding.horizontalMedium,
    this.borderWidth = AppSizes.spaceXL,
    this.borderRadius = AppSizes.borderRadius,
  });
}
