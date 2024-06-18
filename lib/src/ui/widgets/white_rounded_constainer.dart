import 'package:flutter/material.dart';
import '../../src.dart';
class WhiteRoundedConstainer extends StatelessWidget {
  const WhiteRoundedConstainer({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding.allMedium,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            border: Border.all(
              color:
                  Palette.lightPurple.withOpacity(0.2), // Color of the border
              width: 1, // Width of the border
            ),
            color: Palette.white,
            borderRadius: AppBorderRadius.large),
        child: Padding(
          padding: AppPadding.allMedium,
          child: child,
        ),
      ),
    );
  }
}
