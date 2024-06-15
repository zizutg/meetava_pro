import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/account_detail_model.dart';

part 'account_details_provider.g.dart';

@riverpod
class AccountDetailsNotifier extends _$AccountDetailsNotifier {
  @override
  AccountDetailModel build() {
    return AccountDetailModel(
        spentAmount: 75.0,
        spendLimit: 0.0,
        outStandingBalance: 30.0,
        creditLimit: 600.0);
  }

  int get utilizationPercentage =>
      ((state.outStandingBalance / state.creditLimit) * 100).toInt();

  void updateSpentAmount(double value) {
    state = state.copyWith(spentAmount: value);
  }
}
