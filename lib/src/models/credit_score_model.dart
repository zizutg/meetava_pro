class CreditScoreModel {
  final String header;
  final String subHeader;
  final String points;
  final String score_provider_institiution_name;
  bool atHeader = false;
  final List<int> monthlyScores;

  CreditScoreModel(
      {required this.header,
      required this.subHeader,
      required this.points,
      required this.monthlyScores,
      required this.score_provider_institiution_name});
}
