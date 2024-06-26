import '../src.dart';
part 'open_account_provider.g.dart';

@riverpod
class OpenAccountNotifier extends _$OpenAccountNotifier {
  @override
  List<OpenAccountModel> build() {
    return [
      OpenAccountModel(
        accountName: 'Syncb/Amazon',
        balance: 1500,
        limit: 6300,
      ),
      OpenAccountModel(
        accountName: 'BoA/Prefered',
        balance: 1000,
        limit: 5000,
      ),
      OpenAccountModel(
        accountName: 'City/Secured',
        balance: 2000,
        limit: 7000,
      )
    ];
  }

  int calculateRate(OpenAccountModel account) {
    return MathUtils.calculatePercentage(account.balance, account.limit).toInt();
  }
}
