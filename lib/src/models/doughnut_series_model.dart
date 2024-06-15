class DoughnutSeriesModel {
  final Map<String, int> seriesData;
  final int minValue;
  final int maxValue;

  DoughnutSeriesModel(
      {this.seriesData = const {'Good': 50},this.minValue = 0, this.maxValue = 100});
}