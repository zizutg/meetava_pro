import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meetava_pro/src/models/credit_card_factor_model.dart';
import 'package:meetava_pro/src/providers/credit_card_factor_provider.dart';
import 'package:meetava_pro/src/util/color_palette.dart';
import 'package:meetava_pro/src/util/constants.dart';

class CreditFactorCard extends ConsumerWidget {
  const CreditFactorCard({super.key, required this.creditFactorModel});

  final CreditFactorModel creditFactorModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final creditCardFactorNotifier =
        ref.watch(creditCardFactorNotifierProvider.notifier);

    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            smallGap,
            SizedBox(
              width: 90,
              child: Center(
                child: Text(
                  creditFactorModel.title,
                  softWrap: true,
                  overflow: TextOverflow.visible,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Palette.darkPurple,
                  ),
                ),
              ),
            ),
            medGap,
            Text(
              creditFactorModel.number,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Palette.deepPurple,
              ),
            ),
            hugeGap,
            Container(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              decoration: BoxDecoration(
                color: creditCardFactorNotifier
                    .getStatusColor(creditFactorModel.status),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text(
                '${creditFactorModel.status.toUpperCase()} IMPACT',
                style: const TextStyle(color: Colors.white, fontSize: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
