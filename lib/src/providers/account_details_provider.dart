import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/account_detail_model.dart';

part 'account_details_provider.g.dart';

@riverpod
class AccountDetailsNotifier extends _$AccountDetailsNotifier {
  @override
  AccountDetailModel build() {
    return AccountDetailModel(
        spentAmount: 0.0,
        spendLimit: 0.0,
        outStandingBalance: 0.0,
        creditLimit: 0.0);
  }
}
