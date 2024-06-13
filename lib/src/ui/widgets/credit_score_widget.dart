import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meetava_pro/src/providers/credit_score_provider.dart';
import 'package:meetava_pro/src/ui/widgets/white_rounded_constainer.dart';
import 'package:meetava_pro/src/util/constants.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../../util/color_palette.dart';

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
    creditScoreNotifier.getDescriptionAndScore();

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
                Text(
                  creditScoreData.header,
                  style: AppTextStyles.headlineMedium
                      .copyWith(color: Palette.darkPurple),
                ),
                Text(
                  creditScoreData.subHeader,
                  style: AppTextStyles.bodyMedium
                      .copyWith(color: Palette.lightPurple),
                ),
                AppGaps.smallGap,
                Text(
                  creditScoreData.dataSource,
                  style: AppTextStyles.bodySmall.copyWith(
                      color: Palette.medPurple, fontWeight: FontWeight.bold),
                )
              ],
            ),
            const Expanded(child: AppGaps.smallGap),
            if (atBaseHeader) CircleScoreWidget(),
          ],
        ),
        // Chart goes here
        if (!atBaseHeader) YearlyChart()
      ],
    ));
  }
}

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

class CircleScoreWidget extends ConsumerWidget {
  CircleScoreWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final creditScoreNotifier = ref.read(creditScoreNotifierProvider.notifier);
    final Map<String, int> radialChartData =
        creditScoreNotifier.getDescriptionAndScore();

    return SizedBox(
      height: 75,
      width: 75,
      child: SfCircularChart(
        margin: EdgeInsets.zero,
        annotations: [
          CircularChartAnnotation(
            widget: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: '${radialChartData.values.first}\n',
                style: AppTextStyles.displayMedium
                    .copyWith(color: Palette.darkPurple),
                children: [
                  TextSpan(
                    text: '${radialChartData.keys.first}',
                    style: AppTextStyles.bodySmall,
                  ),
                ],
              ),
            ),
          ),
        ],
        series: <CircularSeries>[
          DoughnutSeries<MapEntry<String, double>, String>(
            radius: '100%',
            innerRadius: '80%',
            dataSource: _getChartData(radialChartData),
            xValueMapper: (MapEntry<String, double> data, _) => data.key,
            yValueMapper: (MapEntry<String, double> data, _) => data.value,
            startAngle: 180, // Starts at 270 degrees
            endAngle: 180 + 360,
            // Adding a color to the points
            pointColorMapper: (MapEntry<String, double> data, _) =>
                data.key == 'Current' ? Palette.medGreen : Palette.lightGreen,
          ),
        ],
      ),
    );
  }

  // Generate chart data and compute the percentage
  List<MapEntry<String, double>> _getChartData(Map<String, int> dataMap) {
    int actualValue = dataMap.values.first;
    double percentage = ((actualValue - 300) / (850 - 300)) * 100;
    // Constructing data for filled and unfilled portions of the doughnut
    return [
      MapEntry('Current', percentage),
      MapEntry('Remaining', 100 - percentage),
    ];
  }
}
