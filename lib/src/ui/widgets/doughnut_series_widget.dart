import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../../models/doughnut_series_model.dart';
import '../../util/constants.dart';
import '../../util/color_palette.dart';

class DoughnutSeriesWidget extends ConsumerWidget {
  const DoughnutSeriesWidget(
      {super.key, required this.seriesModel});

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
            dataSource: _getChartData(seriesModel.seriesData, seriesModel.minValue, seriesModel.maxValue),
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
  List<MapEntry<String, double>> _getChartData(Map<String, int> dataMap, int minValue, int maxValue) {
    int actualValue = dataMap.values.first;
    double percentage = ((actualValue - minValue) / (maxValue - minValue)) * 100;
    // Constructing data for filled and unfilled portions of the doughnut
    return [
      MapEntry('Current', percentage),
      MapEntry('Remaining', 100 - percentage),
    ];
  }
}
