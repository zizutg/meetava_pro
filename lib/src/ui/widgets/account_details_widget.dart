import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meetava_pro/src/providers/account_details_provider.dart';
import 'package:meetava_pro/src/ui/widgets/white_rounded_constainer.dart';
import 'package:meetava_pro/src/util/color_palette.dart';
import 'package:meetava_pro/src/util/constants.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:syncfusion_flutter_core/theme.dart';

class AccountDetailsWidget extends ConsumerWidget {
  const AccountDetailsWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final accountDetailsProvider = ref.watch(accountDetailsNotifierProvider);
    final accountDetailsNotifier =
        ref.read(accountDetailsNotifierProvider.notifier);

    return WhiteRoundedConstainer(
        child: Column(
      children: [
        // TO-DO Slider bar goes here
        AppGaps.vHugeGap,
        SfSliderTheme(
          data: const SfSliderThemeData(
            overlayRadius: 0,

            activeTrackHeight: 8,
            inactiveTrackHeight: 8,
            activeTrackColor: Palette.lightGreen,
            inactiveTrackColor: Palette.lightGreen,
            thumbStrokeColor: Palette.medGreen,
            thumbColor: Palette.medGreen,
            tooltipBackgroundColor: Palette.deepPurple,
            //activeco
            thumbRadius: 3,
          ),
          child: SfSlider(
              min: 0,
              max: 100,
              thumbShape: const SfThumbShape(),
              value: accountDetailsProvider.spentAmount.toInt(),
              interval: 1,
              shouldAlwaysShowTooltip: true,
              tooltipTextFormatterCallback: (actualValue, formattedText) =>
                  '\$$actualValue',
              onChanged: (dynamic value) {
                accountDetailsNotifier.updateSpentAmount(value);
              }),
        ),
        RichText(text: TextSpan(children: [TextSpan(text: 'sss')])),
        const Row(
          children: [
            // TO-DO Add Two Rich texts here
          ],
        ),
        AppGaps.vSmallGap,
        const Divider(),
        // TO-DO Utilization goes here
        const Row(
          children: [],
        )
      ],
    ));
  }
}
