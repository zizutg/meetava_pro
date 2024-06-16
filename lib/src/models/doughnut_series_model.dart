class DoughnutSeriesModel {
  final Map<String, int> seriesData;
  final int startAngle;
  final int endAngle;
  final int minValue;
  final int maxValue;

  DoughnutSeriesModel(
      {this.seriesData = const {'Good': 50},
      this.startAngle = 180,
      this.endAngle = 540,
      this.minValue = 0,
      this.maxValue = 100});
}
