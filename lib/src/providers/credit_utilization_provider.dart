import 'package:meetava_pro/src/models/credit_card_utilization_model.dart';
import 'package:meetava_pro/src/util/math_util.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'credit_utilization_provider.g.dart';

@riverpod
class CreditUtilizationNotifier extends _$CreditUtilizationNotifier {
  @override
  CreditCardUtilizationModel build() {
    return CreditCardUtilizationModel(
      totalBalance: 8390,
      totalLimit: 200900,
    );
  }

  int get utilizationRate =>
      MathUtils.calculatePercentage(state.totalBalance, state.totalLimit)
          .toInt();

  String get category {
    if (utilizationRate <= 29) {
      return 'Excellent';
    } else if (utilizationRate <= 50) {
      return 'Good';
    } else {
      return 'Poor';
    }
  }
}
