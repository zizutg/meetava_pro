import '../src.dart';
import 'dart:math';


part 'credit_score_provider.g.dart';

@riverpod
class CreditScoreNotifier extends _$CreditScoreNotifier {
  @override
  CreditScoreModel build() {
    return CreditScoreModel(
      header: 'Credit Score',
      subHeader: 'Updated Today · Next May 12',
      points: '+2pts',
      monthlyScores: List.generate(12, (_) => 300 + Random().nextInt(551)),
      dataSource: 'Experian',
    );
  }

  int get currentScore => state.monthlyScores.last;

  String get category {
    if (currentScore >= 781) {
      return 'Excellent';
    } else if (currentScore >= 661) {
      return 'Good';
    } else if (currentScore >= 601) {
      return 'Fair';
    } else if (currentScore >= 500) {
      return 'Poor';
    } else {
      return 'Very Poor';
    }
  }

  
  
}
