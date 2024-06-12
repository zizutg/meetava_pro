import 'package:flutter/material.dart';
import 'package:meetava_pro/src/util/color_palette.dart';

class WhiteRoundedConstainer extends StatelessWidget {
  const WhiteRoundedConstainer({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Palette.white,
          borderRadius: BorderRadius.circular(16)
        ),
        child: child,
      ),
    );
  }
}