import 'package:flutter/material.dart';
import '../src.dart';
part 'credit_card_factor_provider.g.dart';



@riverpod
class CreditCardFactorNotifier extends _$CreditCardFactorNotifier {
  @override
  List<CreditFactorModel> build() {
    return [
      CreditFactorModel(
          title: 'Payment History', number: '100%', status: 'high'),
      CreditFactorModel(
          title: 'Credit Card Utilization', number: '4%', status: 'low'),
      CreditFactorModel(title: 'Derogatory Marks', number: '2', status: 'med'),
      CreditFactorModel(
          title: 'Age of Credit History', number: '1ys 4mo', status: 'low'),
      CreditFactorModel(title: 'Hard Enquiries', number: '3', status: 'med'),
      CreditFactorModel(title: 'Total Accounts', number: '9', status: 'med'),
    ];
  }

  Color getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'high':
        return Palette.darkGreen;
      case 'low':
        return Palette.medGreen;
      case 'med':
        return Palette.lightGreen;
      default:
        return Colors.grey;
    }
  }
}
