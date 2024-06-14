class AccountDetailModel {
  final double spentAmount;
  final double spendLimit;
  final double outStandingBalance;
  final double creditLimit;

  AccountDetailModel(
      {required this.spentAmount,
      required this.spendLimit,
      required this.outStandingBalance,
      required this.creditLimit});
}
