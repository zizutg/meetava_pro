import '../models/credit_score_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
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
        score_provider_institiution_name: 'Experian');
  }

  Map<String, int> getDescriptionAndScore() {
    int score = state.monthlyScores.last;
    String description = '';

    if (score >= 781) {
      description = 'Excellent';
    } else if (score >= 661) {
      description = 'Good';
    } else if (score >= 601) {
      description = 'Fair';
    } else if (score >= 500) {
      description = 'Poor';
    } else {
      description = 'Very Poor';
    }

    return {description: score};
  }
}
