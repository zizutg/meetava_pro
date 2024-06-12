class CreditScoreModel {
  final String header;
  final String subHeader;
  final String points;
  final String score_provider_institiution_name;
  final List<int> monthlyScores = [];

  CreditScoreModel({required this.header, required this.subHeader, required this.points, required this.score_provider_institiution_name});
  
}