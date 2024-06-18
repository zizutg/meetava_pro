import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../src.dart';
class CreditFactorCard extends ConsumerWidget {
  const CreditFactorCard({super.key, required this.creditFactorModel});

  final CreditFactorModel creditFactorModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final creditCardFactorNotifier =
        ref.watch(creditCardFactorNotifierProvider.notifier);

    return Card(
      elevation: 1,
      color: Palette.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: AppPadding.allMedium,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AppGaps.vSmallGap,
            SizedBox(
              width: 100,
              child: Center(
                child: Text(
                  creditFactorModel.title,
                  softWrap: true,
                  overflow: TextOverflow.visible,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.headlineSmall
                      .copyWith(fontSize: 14, color: Palette.darkPurple),
                ),
              ),
            ),
            AppGaps.vMedGap,
            Text(
              creditFactorModel.number,
              style: AppTextStyles.headlineLarge
                  .copyWith(color: Palette.deepPurple),
            ),
            AppGaps.vLargeGap,
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
