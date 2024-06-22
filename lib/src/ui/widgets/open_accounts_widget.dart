import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import '../../src.dart';
class OpenAccountsWidget extends ConsumerWidget {
  const OpenAccountsWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final accounts = ref.watch(openAccountNotifierProvider);

    return WhiteRoundedConstainer(
      child: Column(
        children: accounts.map((account) {
          final rate = ref
              .read(openAccountNotifierProvider.notifier)
              .calculateRate(account)
              .toDouble();
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildAccountHeader(account.accountName, rate),
              AppGaps.vSmallGap,
              _buildAccountSlider(rate),
              AppGaps.vSmallGap,
              _buildAccountBalanceDetails(account.balance, account.limit),
              _buildReportedDate(DateTime.now()),
              if (account != accounts.last) const Divider(),
              if (account != accounts.last) AppGaps.vMedGap
            ],
          );
        }).toList(),
      ),
    );
  }

  Widget _buildAccountHeader(String accountName, double rate) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          accountName,
          style:
              AppTextStyles.headlineMedium.copyWith(color: Palette.darkPurple),
        ),
        const Expanded(child: SizedBox(width: 16)),
        Text(
          '${rate.toStringAsFixed(2)}%',
          style:
              AppTextStyles.headlineMedium.copyWith(color: Palette.darkPurple),
        ),
      ],
    );
  }

  Widget _buildAccountSlider(double rate) {
    return SfSliderTheme(
      data: const SfSliderThemeData(
        overlayRadius: 0,
        activeTrackHeight: 8,
        inactiveTrackHeight: 8,
        activeTrackColor: Palette.medGreen,
        inactiveTrackColor: Colors.grey,
        thumbRadius: 0,
      ),
      child: SfSlider(
        interval: 1,
        stepDuration: const SliderStepDuration(seconds: 2),
        min: 0,
        max: 100,
        value: rate,
        onChanged: (_) {},
      ),
    );
  }

  Widget _buildAccountBalanceDetails(int balance, int limit) {
    return Row(
      children: [
        Text(
          '${NumberFormat('\$#,##0').format(balance)} Balance',
          style: AppTextStyles.titleMedium.copyWith(color: Palette.darkPurple),
        ),
        const Expanded(child: AppGaps.hMedGap),
        Text(
          '${NumberFormat('\$#,##0').format(limit)} Limit',
          style: AppTextStyles.titleMedium.copyWith(color: Palette.darkPurple),
        ),
      ],
    );
  }

  Widget _buildReportedDate(DateTime date) {
    return Text(
      'Reported on ${DateFormat.yMMMd().format(date)}',
      style: AppTextStyles.titleMedium.copyWith(color: Palette.lightPurple),
    );
  }
}
