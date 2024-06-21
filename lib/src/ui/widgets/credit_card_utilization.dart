import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import '../../src.dart';
import 'package:intl/intl.dart';

class CreditCardUtilization extends ConsumerWidget {
  const CreditCardUtilization({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //final creditUtilizationProvider = ref.watch(creditUtilizationNotifierProvider);
    final creditCardUtilizationNotifier =
        ref.read(creditUtilizationNotifierProvider.notifier);
    final seriesData = {
      creditCardUtilizationNotifier.category: creditCardUtilizationNotifier.rate
    };

    return WhiteRoundedConstainer(
        child: Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _utilizationHeader(ref),
            const Expanded(child: AppGaps.hSmallGap),
            DoughnutSeriesWidget(
              seriesModel: DoughnutSeriesModel(
                  seriesData: seriesData,
                  startAngle: 0,
                  endAngle: 360,
                  currentColor: creditCardUtilizationNotifier.color,
                  remainingColor:
                      creditCardUtilizationNotifier.color.withOpacity(0.25)),
            ),
          ],
        ),
        AppGaps.vSmallGap,
        _buildSfLinearGauge(ranges: [
          _buildCurrentCatagoryRange(creditCardUtilizationNotifier)
        ]),
        Container(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration:
                const BoxDecoration(borderRadius: AppBorderRadius.small),
            child: _buildSfLinearGauge(
              ranges: _generateGaugeRange(ref),
              // markerPointers: _generateMarkerPointers(ref)),
            )),
        _buildSfLinearGauge(markerPointers: _generateMarkerPointers(ref)),
        _buildSfLinearGauge(ranges: _generateGaugeLabels(ref)),

        /* _buildGaugeWithLabels(rate),
        _buildColoredGauge(),
        _buildPercentageLabels(rate), */
      ],
    ));
  }

  LinearGaugeRange _buildCurrentCatagoryRange(
      CreditUtilizationNotifier creditCardUtilizationNotifier) {
    return LinearGaugeRange(
      startWidth: AppSizes.spaceXL,
      endWidth: AppSizes.spaceXL,
      startValue: creditCardUtilizationNotifier.range,
      endValue: creditCardUtilizationNotifier.range + 30,
      color: Colors.transparent,
      position: LinearElementPosition.outside,
      child: Center(
        child: Text(
          creditCardUtilizationNotifier.category,
          style: AppTextStyles.bodyLarge.copyWith(
              color: creditCardUtilizationNotifier.color,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  List<LinearShapePointer> _generateMarkerPointers(WidgetRef ref) {
    final creditCardUtilizationNotifier =
        ref.read(creditUtilizationNotifierProvider.notifier);

    final tickValues = creditCardUtilizationNotifier.tickValues;

    return tickValues
        .map((value) => LinearShapePointer(
              value: value,
              height: AppSizes.spaceMedium,
              shapeType: LinearShapePointerType.rectangle,
              width: AppSizes.spaceXXS,
              offset: AppSizes.spaceXS,
              color: creditCardUtilizationNotifier.tickColor(value),
              position: LinearElementPosition.inside,
            ))
        .toList();
  }

  RichText _utilizationHeader(WidgetRef ref) {
    final creditCardUtilizationProvider =
        ref.watch(creditUtilizationNotifierProvider);
    final totalBalance = creditCardUtilizationProvider.totalBalance;
    final totalLimit = creditCardUtilizationProvider.totalLimit;

    return RichText(
      text: TextSpan(
        children: [
          _buildTextSpan(
            'Total balance: ',
            AppTextStyles.headlineMedium.copyWith(color: Palette.darkPurple),
          ),
          _buildTextSpan(
            '${NumberFormat('\$#,##0').format(totalBalance)}\n',
            AppTextStyles.headlineMedium.copyWith(color: Palette.medGreen),
          ),
          _buildTextSpan(
            'Total limit: ${NumberFormat('\$#,##0').format(totalLimit)}\n',
            AppTextStyles.titleLarge
                .copyWith(color: Palette.lightPurple, height: 2),
          ),
        ],
      ),
    );
  }

  SfLinearGauge _buildSfLinearGauge({
    List<LinearGaugeRange> ranges = const [],
    List<LinearMarkerPointer> markerPointers = const [],
  }) {
    return SfLinearGauge(
      minimum: 0,
      maximum: 90,
      showAxisTrack: false,
      showTicks: false,
      showLabels: false,
      ranges: ranges,
      markerPointers: markerPointers,
    );
  }

  List<LinearGaugeRange> _generateGaugeRange(WidgetRef ref) {
    final creditCardUtilizationNotifier =
        ref.read(creditUtilizationNotifierProvider.notifier);

    final gaugeRangeData = creditCardUtilizationNotifier.gaugeColors;

    double strartEnd = 0;

    return gaugeRangeData.map((color) {
      LinearGaugeRange range = LinearGaugeRange(
        startWidth: AppSizes.spaceXL,
        endWidth: AppSizes.spaceXL,
        startValue: strartEnd,
        endValue: strartEnd += 30,
        color: color,
        position: LinearElementPosition.outside,
      );
      return range;
    }).toList();

    /* return gaugeRangeData.entries.map((entry) {
      LinearGaugeRange range = LinearGaugeRange(
        startWidth: AppSizes.spaceXL,
        endWidth: AppSizes.spaceXL,
        startValue: strartEnd,
        endValue: strartEnd += 30,
        color: entry.key,
        position: LinearElementPosition.outside,
      );
      return range;
    }).toList(); */
  }

  TextSpan _buildTextSpan(String text, TextStyle style) {
    return TextSpan(
      text: text,
      style: style,
    );
  }

  List<LinearGaugeRange> _generateGaugeLabels(WidgetRef ref) {
    final creditCardUtilizationNotifier =
        ref.read(creditUtilizationNotifierProvider.notifier);

    final labelsMap = creditCardUtilizationNotifier.labelMap;

    return labelsMap.entries.map((entry) {
      final map = creditCardUtilizationNotifier.getColorAndAlignment(entry.key);
      Color color = map['color'];
      Alignment alignment = map['alignment'];

      LinearGaugeRange range = LinearGaugeRange(
        startWidth: AppSizes.spaceXL,
        endWidth: AppSizes.spaceXL,
        startValue: entry.value[0],
        endValue: entry.value[1],
        color: Colors.transparent,
        position: LinearElementPosition.outside,
        child: Align(
          alignment: alignment,
          child: Text(
            entry.key,
            style: AppTextStyles.bodyLarge.copyWith(
              color: color,
              fontWeight: color == Palette.lightPurple
                  ? FontWeight.normal
                  : FontWeight.bold,
            ),
          ),
        ),
      );

      return range;
    }).toList();
  }
}
