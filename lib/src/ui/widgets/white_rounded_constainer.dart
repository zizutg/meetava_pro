import 'package:flutter/material.dart';
import 'package:meetava_pro/src/util/color_palette.dart';

class WhiteRoundedConstainer extends StatelessWidget {
  const WhiteRoundedConstainer({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(
              color:
                  Palette.lightPurple.withOpacity(0.2), // Color of the border
              width: 1, // Width of the border
            ),
            color: Palette.white,
            borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: child,
        ),
      ),
    );
  }
}
