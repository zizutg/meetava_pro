import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import '../../src.dart';

class AccountDetailsWidget extends ConsumerWidget {
  const AccountDetailsWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final accountDetailsProvider = ref.watch(accountDetailsNotifierProvider);
    final accountDetailsNotifier =
        ref.read(accountDetailsNotifierProvider.notifier);

    final utilizationPercentage = MathUtils.calculatePercentage(
        accountDetailsProvider.outStandingBalance.toInt(),
        accountDetailsProvider.creditLimit.toInt());

    return WhiteRoundedConstainer(
        child: Column(
      children: [
        // TO-DO Slider bar goes here
        AppGaps.vHugeGap,
        AppGaps.vMedGap,
        // const _AccountDetailSlider(),
        _accountDetailsSlider(accountDetailsProvider, accountDetailsNotifier),
        AppGaps.vSmallGap,
        _spendLimitNote(),
        AppGaps.vHugeGap,
        _balanceAndLimit(accountDetailsProvider),
        AppGaps.vSmallGap,
        const Divider(),
        // TO-DO Utilization goes here
        _utilization(utilizationPercentage.toInt())
      ],
    ));
  }

  Row _utilization(int utilization) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Utilization',
          style: AppTextStyles.titleLarge.copyWith(fontSize: 16),
        ),
        const Expanded(child: AppGaps.hHugeGap),
        Text(
          '$utilization%',
          style:
              AppTextStyles.headlineSmall.copyWith(color: Palette.darkPurple),
        ),
      ],
    );
  }

  RichText _spendLimitNote() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: 'Spend limit: \$100 ',
        style: AppTextStyles.titleLarge.copyWith(fontSize: 14),
        children: [
          TextSpan(
            text: 'Why is it different?',
            style: AppTextStyles.headlineSmall.copyWith(fontSize: 12),
          ),
        ],
      ),
    );
  }

  SfSliderTheme _accountDetailsSlider(AccountDetailModel accountDetailsProvider,
      AccountDetailsNotifier accountDetailsNotifier) {
    return SfSliderTheme(
      data: const SfSliderThemeData(
        overlayRadius: 0,
        activeTrackHeight: AppSizes.spaceSmall,
        inactiveTrackHeight: AppSizes.spaceSmall,
        activeTrackColor: Palette.lightGreen,
        inactiveTrackColor: Palette.lightGreen,
        thumbStrokeColor: Palette.medGreen,
        thumbColor: Palette.medGreen,
        tooltipBackgroundColor: Palette.deepPurple,
        thumbRadius: AppSizes.spaceXXS,
      ),
      child: SfSlider(
          min: 0,
          max: 100,
          thumbShape: const SfThumbShape(),
          value: accountDetailsProvider.spentAmount.toInt(),
          interval: 1,
          shouldAlwaysShowTooltip: true,
          tooltipTextFormatterCallback: (actualValue, formattedText) =>
              '\$$actualValue',
          onChanged: (dynamic value) {
            accountDetailsNotifier.updateSpentAmount(value);
          }),
    );
  }

  Row _balanceAndLimit(AccountDetailModel accountDetailsProvider) {
    return Row(
      children: [
        RichText(
          textAlign: TextAlign.left,
          text: TextSpan(
            text: '\$${accountDetailsProvider.outStandingBalance.toInt()}\n',
            style: AppTextStyles.headlineLarge
                .copyWith(fontWeight: FontWeight.bold),
            children: [
              TextSpan(
                text: 'Balance',
                style: AppTextStyles.titleLarge.copyWith(fontSize: 14),
              ),
            ],
          ),
        ),
        const Expanded(child: AppGaps.hHugeGap),
        RichText(
          textAlign: TextAlign.right,
          text: TextSpan(
            text: '\$${accountDetailsProvider.creditLimit.toInt()}\n',
            style: AppTextStyles.headlineLarge
                .copyWith(fontWeight: FontWeight.bold),
            children: [
              TextSpan(
                text: 'Credit Limit',
                style: AppTextStyles.titleLarge.copyWith(fontSize: 14),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
