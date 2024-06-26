import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../../src.dart';

class DoughnutSeriesWidget extends ConsumerWidget {
  const DoughnutSeriesWidget({super.key, required this.seriesModel});

  final DoughnutSeriesModel seriesModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                text: '${seriesModel.seriesData.values.first}\n',
                style: AppTextStyles.displayMedium.copyWith(
                  color: Palette.darkPurple,
                  fontFamily: 'AtSlamCndTRIAL',
                  fontSize: 45,
                  fontWeight: FontWeight.w500,
                ),
                children: [
                  TextSpan(
                    text: seriesModel.seriesData.keys.first,
                    style: AppTextStyles.bodySmall
                        .copyWith(fontFamily: 'AtHaussAero', height: 0.5),
                  ),
                ],
              ),
            ),
          ),
        ],
        series: <CircularSeries>[
          DoughnutSeries<MapEntry<String, double>, String>(
            radius: '100%',
            innerRadius: '85%',
            dataSource: _getChartData(
                seriesModel.seriesData.values.first, seriesModel.maxValue),
            xValueMapper: (MapEntry<String, double> data, _) => data.key,
            yValueMapper: (MapEntry<String, double> data, _) => data.value,
            startAngle: seriesModel.startAngle,
            endAngle: seriesModel.endAngle,
            pointColorMapper: (MapEntry<String, double> data, _) =>
                data.key == 'Current'
                    ? seriesModel.currentColor
                    : seriesModel.remainingColor,
          ),
        ],
      ),
    );
  }

  List<MapEntry<String, double>> _getChartData(int actualValue, int maxValue) {
    double percentage = MathUtils.calculatePercentage(actualValue, maxValue);
    return [
      MapEntry('Current', percentage),
      MapEntry('Remaining', 100 - percentage),
    ];
  }
}
