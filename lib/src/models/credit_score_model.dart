class CreditScoreModel {
  final String header;
  final String subHeader;
  final String points;
  final String dataSource;
  final List<int> monthlyScores;

  CreditScoreModel(
      {required this.header,
      required this.subHeader,
      required this.points,
      required this.monthlyScores,
      required this.dataSource,
    });

}
