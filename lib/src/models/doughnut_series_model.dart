import 'package:flutter/widgets.dart';
import 'package:meetava_pro/src/src.dart';

class DoughnutSeriesModel {
  final Map<String, int> seriesData;
  final int startAngle;
  final int endAngle;
  final int minValue;
  final int maxValue;
  final Color currentColor;
  final Color remainingColor;

  DoughnutSeriesModel(
      {this.seriesData = const {'Good': 50},
      this.startAngle = 180,
      this.endAngle = 540,
      this.minValue = 0,
      this.maxValue = 100,
      this.currentColor = Palette.medGreen,
      this.remainingColor = Palette.lightGreen});
}
