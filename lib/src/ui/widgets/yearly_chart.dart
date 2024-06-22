import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../src.dart';


class YearlyChart extends ConsumerWidget {
  const YearlyChart({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final creditScoreData = ref.watch(creditScoreNotifierProvider);
    ref.read(creditScoreNotifierProvider.notifier);

    return SizedBox(
      height: 128,
      child: Center(
          child: SfCartesianChart(
        plotAreaBorderWidth: 0,
        primaryXAxis: const NumericAxis(
          isVisible: false,
        ),
        primaryYAxis: const NumericAxis(
          axisLine: AxisLine(width: 0),
          majorTickLines: MajorTickLines(width: 0),
          minimum: 300,
          maximum: 850,
        ),
        tooltipBehavior: TooltipBehavior(enable: true),
        series: [
          LineSeries<int, int>(
            color: Palette.medGreen,
            dataSource: creditScoreData.monthlyScores,
            xValueMapper: (int value, int index) => index + 1,
            yValueMapper: (int value, int index) => value,
            markerSettings: const MarkerSettings(
              isVisible: true,
            ),
            //dataLabelSettings: DataLabelSettings(isVisible: false),
            animationDuration: 3000, // Animation duration in milliseconds
          )
        ],
      )),
    );
  }
}
