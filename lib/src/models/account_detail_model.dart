class AccountDetailModel {
  double spentAmount;
  final double spendLimit;
  final double outStandingBalance;
  final double creditLimit;

  AccountDetailModel(
      {required this.spentAmount,
      required this.spendLimit,
      required this.outStandingBalance,
      required this.creditLimit});

  AccountDetailModel copyWith({
    double? spentAmount,
    double? spendLimit,
    double? outStandingBalance,
    double? creditLimit,
  }) {
    return AccountDetailModel(
      spentAmount: spentAmount ?? this.spentAmount,
      spendLimit: spendLimit ?? this.spendLimit,
      outStandingBalance: outStandingBalance ?? this.outStandingBalance,
      creditLimit: creditLimit ?? this.creditLimit,
    );
  }
}
