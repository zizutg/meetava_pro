import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../src.dart';

class BaseHeaderWidget extends ConsumerWidget {
  const BaseHeaderWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: const BoxDecoration(
          color: Palette.deepPurple,
          borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(AppSizes.spaceMedium))),
      child: const CreditScoreWidget(
        atBaseHeader: true,
      ),
    );
  }
}
