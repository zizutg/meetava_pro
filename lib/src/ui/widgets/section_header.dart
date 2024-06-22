import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../src.dart';
class SectionHeader extends ConsumerWidget {
  const SectionHeader({super.key, required this.title});

  final String title;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: AppPadding.allSmall.copyWith(right: 0, top: 0, bottom: 0),
      alignment: Alignment.bottomLeft,
      width: double.infinity,
      child: Column(
        children: [
          AppGaps.vHugeGap,
          Text(title, style: AppTextStyles.displaySmall
              ),
        ],
      ),
    );
  }
}
