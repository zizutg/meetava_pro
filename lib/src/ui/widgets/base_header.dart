import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meetava_pro/src/ui/widgets/credit_score_widget.dart';
import 'package:meetava_pro/src/util/color_palette.dart';

class BaseHeaderWidget extends ConsumerWidget {
  const BaseHeaderWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      //color: Palette.deepPurple,
      //height: 50,
      decoration: const BoxDecoration(
          color: Palette.deepPurple,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(16),
              bottomRight: Radius.circular(16))),

      child: const CreditScoreWidget(atBaseHeader: true,),
    );
  }
}
