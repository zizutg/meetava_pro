import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../src.dart';
class CreditScoreWidget extends ConsumerWidget {
  const CreditScoreWidget({
    super.key,
    required this.atBaseHeader,
  });

  final bool atBaseHeader;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final creditScoreData = ref.watch(creditScoreNotifierProvider);
    final creditScoreNotifier = ref.read(creditScoreNotifierProvider.notifier);
    final seriesData = {
      creditScoreNotifier.category: creditScoreNotifier.currentScore
    };
    return WhiteRoundedConstainer(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // Column for the text and points widget
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      creditScoreData.header,
                      style: AppTextStyles.headlineMedium
                          .copyWith(color: Palette.darkPurple),
                    ),
                    AppGaps.hSmallGap,
                    Container(
                      //TODO: Change with app constant
                      padding: const EdgeInsets.symmetric(horizontal: 2),
                      decoration: BoxDecoration(
                        //TODO: Change with app constant
                          borderRadius: BorderRadius.circular(20),
                          color: Palette.medGreen),
                      child: Text(
                        creditScoreData.points,
                        style: AppTextStyles.bodyMedium
                            .copyWith(color: Palette.white),
                      ),
                    )
                  ],
                ),
                Text(
                  creditScoreData.subHeader,
                  style: AppTextStyles.bodyMedium
                      .copyWith(color: Palette.lightPurple),
                ),
                AppGaps.vSmallGap,
                Text(
                  creditScoreData.dataSource,
                  style: AppTextStyles.bodySmall.copyWith(
                      color: Palette.medPurple, fontWeight: FontWeight.bold),
                )
              ],
            ),
            const Expanded(child: AppGaps.vSmallGap),
            if (atBaseHeader)
              DoughnutSeriesWidget(
                seriesModel: DoughnutSeriesModel(
                    seriesData: seriesData, minValue: 300, maxValue: 850),
              ),
          ],
        ),
        // Chart goes here
        if (!atBaseHeader) const YearlyChart()
      ],
    ));
  }
}
