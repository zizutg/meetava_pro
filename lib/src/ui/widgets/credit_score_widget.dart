import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meetava_pro/src/providers/credit_score_provider.dart';
import 'package:meetava_pro/src/ui/widgets/white_rounded_constainer.dart';
import 'package:meetava_pro/src/util/constants.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../../util/color_palette.dart';

class CreditScoreWidget extends ConsumerWidget {
  const CreditScoreWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final creditScoreData = ref.watch(creditScoreNotifierProvider);
    final creditScoreNotifier = ref.read(creditScoreNotifierProvider.notifier);
    final textTheme = ref.watch(textThemeProvider);
    final Map<String, int> radialChartData =
        creditScoreNotifier.getDescriptionAndScore();

    return WhiteRoundedConstainer(
        child: Column(
      children: [
        Row(
          children: [
            // Column for the text and points widget
            Column(
              //mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  creditScoreData.header,
                  style:
                      textTheme.titleLarge!.copyWith(color: Palette.darkPurple),
                ),
                Text(
                  creditScoreData.subHeader,
                  style: textTheme.bodyMedium,
                ),
                smallGap,
                Text(creditScoreData.score_provider_institiution_name)
              ],
            ),
            // Radial Bar goes here
            Visibility(
                child: Center(
              child: SfCircularChart(
                annotations: [
                  CircularChartAnnotation(
                      widget: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: '${creditScoreData.monthlyScores.last}\n',
                      style: textTheme.displayMedium!
                          .copyWith(color: Palette.darkPurple),
                      children: [
                        TextSpan(
                            text: creditScoreNotifier
                                .getDescriptionAndScore()
                                .keys
                                .first,
                            style: textTheme.bodySmall)
                      ],
                    ),
                  )),
                ],
                series: <CircularSeries>[
                  RadialBarSeries<MapEntry<String, int>, String>(
                    name: 'love',
                    maximumValue: 850,
                    radius: '30%',
                    innerRadius: '80%',
                    enableTooltip: false,
                    dataSource: radialChartData.entries.toList(),
                    xValueMapper: (MapEntry<String, int> data, _) => data.key,
                    yValueMapper: (MapEntry<String, int> data, _) =>
                        data.value.toDouble(),
                    pointColorMapper: (MapEntry<String, int> data, _) =>
                        Palette.medGreen,
                    trackColor: Palette.lightGreen,
                    dataLabelSettings: const DataLabelSettings(
                        isVisible: false, color: Palette.medGreen),
                  ),
                ],
              ),
            ))
          ],
        ),
        // Chart goes here
        Visibility(
          visible: true,
          child: SizedBox(
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
          ),
        )
      ],
    ));
  }
}
