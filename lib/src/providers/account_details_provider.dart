import '../src.dart';

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

  void updateSpentAmount(double value) {
    state = state.copyWith(spentAmount: value);
  }
}
