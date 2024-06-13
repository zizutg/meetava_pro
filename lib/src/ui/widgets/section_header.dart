import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meetava_pro/src/util/constants.dart';

class SectionHeader extends ConsumerWidget {
  const SectionHeader({super.key, required this.title});

  final String title;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = ref.watch(textThemeProvider);
    return Container(
      alignment: Alignment.bottomLeft,
      width: double.infinity,
      child: Column(
        children: [
          hugeGap,
          Text(title, style: textTheme.displaySmall
              //!.copyWith(fontWeight: FontWeight.bold),
              ),
        ],
      ),
    );
  }
}
