import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meetava_pro/src/providers/credit_utilization_provider.dart';
import 'package:meetava_pro/src/ui/widgets/doughnut_series_widget.dart';
import 'package:meetava_pro/src/ui/widgets/white_rounded_constainer.dart';
import 'package:meetava_pro/src/util/color_palette.dart';
import 'package:meetava_pro/src/util/constants.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import '../../models/doughnut_series_model.dart';
import 'package:intl/intl.dart';

class CreditCardUtilization extends ConsumerWidget {
  const CreditCardUtilization({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final creditCardUtilizationProvider =
        ref.watch(creditUtilizationNotifierProvider);
    final creditCardUtilizationNotifier =
        ref.read(creditUtilizationNotifierProvider.notifier);
    final seriesData = {
      creditCardUtilizationNotifier.category:
          creditCardUtilizationNotifier.utilizationRate
    };
    final totalBalance = creditCardUtilizationProvider.totalBalance;
    final totalLimit = creditCardUtilizationProvider.totalLimit;
    final rate = creditCardUtilizationNotifier.utilizationRate;

    return WhiteRoundedConstainer(
        child: Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
                text: TextSpan(children: [
              TextSpan(
                text: 'Total balance: ',
                style: AppTextStyles.headlineMedium
                    .copyWith(color: Palette.darkPurple),
              ),
              TextSpan(
                text: '${NumberFormat('\$#,##0').format(totalBalance)}\n',
                style: AppTextStyles.headlineMedium.copyWith(
                  color: Palette.medGreen,
                ),
              ),
              TextSpan(
                text:
                    'Total limit: ${NumberFormat('\$#,##0').format(totalLimit)}\n',
                style: AppTextStyles.titleLarge
                    .copyWith(color: Palette.lightPurple, height: 2),
              )
            ])),
            const Expanded(child: AppGaps.hSmallGap),
            DoughnutSeriesWidget(
              seriesModel: DoughnutSeriesModel(
                  seriesData: seriesData, startAngle: 0, endAngle: 360),
            ),
          ],
        ),
        
        AppGaps.vSmallGap,
        
        _buildGaugeWithLabels(rate),
        _buildColoredGauge(),
        _buildPercentageLabels(rate),
      ],
    ));
  }

  SfLinearGauge _buildGaugeWithLabels(int rate) {
    return SfLinearGauge(
      minimum: 0,
      maximum: 90,
      axisTrackStyle: const LinearAxisTrackStyle(thickness: 0),
      showAxisTrack: false,
      showLabels: false,
      showTicks: false,
      labelPosition: LinearLabelPosition.inside,
      labelOffset: 5,
      ranges: [
        if (rate <= 29) _buildGaugeRange(0, 30, 'Excellent', Palette.medGreen),
        if (rate > 29 && rate <= 49)
          _buildGaugeRange(30, 60, 'Good', Palette.lightYellow),
        if (rate > 49) _buildGaugeRange(60, 90, 'Poor', Palette.lightRed),
      ],
    );
  }

  SfLinearGauge _buildColoredGauge() {
    return SfLinearGauge(
      minimum: 0,
      maximum: 90,
      axisTrackStyle: const LinearAxisTrackStyle(thickness: 0),
      showAxisTrack: false,
      showLabels: false,
      showTicks: false,
      labelPosition: LinearLabelPosition.outside,
      labelOffset: 15,
      ranges: const [
        LinearGaugeRange(
          edgeStyle: LinearEdgeStyle.startCurve,
          startValue: 0,
          endValue: 30,
          color: Palette.medGreen,
          startWidth: 30,
          endWidth: 30,
        ),
        LinearGaugeRange(
          startValue: 30,
          endValue: 60,
          color: Palette.lightYellow,
          startWidth: 30,
          endWidth: 30,
        ),
        LinearGaugeRange(
          edgeStyle: LinearEdgeStyle.endCurve,
          rangeShapeType: LinearRangeShapeType.curve,
          startValue: 60,
          endValue: 90,
          color: Palette.lightRed,
          startWidth: 30,
          endWidth: 30,
        ),
      ],
      markerPointers: _buildMarkerPointers(),
    );
  }

  SfLinearGauge _buildPercentageLabels(int rate) {
    return SfLinearGauge(
      minimum: 0,
      maximum: 90,
      axisTrackStyle: const LinearAxisTrackStyle(thickness: 0),
      showAxisTrack: false,
      showLabels: false,
      showTicks: false,
      labelPosition: LinearLabelPosition.inside,
      labelOffset: 5,
      ranges: [
        _buildPercentageRange(0, 30, '0-9%', rate <= 9),
        _buildPercentageRange(15, 30, '10-29%', rate > 9 && rate <= 29),
        _buildPercentageRange(37, 60, '30-49%', rate > 29 && rate <= 49),
        _buildPercentageRange(60, 90, '50-74%', rate > 49 && rate <= 74),
        _buildPercentageRange(78, 90, '>75%', rate > 75),
      ],
    );
  }

  LinearGaugeRange _buildGaugeRange(
      double start, double end, String label, Color color) {
    return LinearGaugeRange(
      startValue: start,
      endValue: end,
      color: Colors.transparent,
      startWidth: 30,
      endWidth: 30,
      child: Center(
        child: Text(
          label,
          style: AppTextStyles.bodyLarge
              .copyWith(fontWeight: FontWeight.bold, color: color),
        ),
      ),
    );
  }

  LinearGaugeRange _buildPercentageRange(
      double start, double end, String label, bool highlight) {
    return LinearGaugeRange(
      startValue: start,
      endValue: end,
      color: Colors.transparent,
      startWidth: 30,
      endWidth: 30,
      child: Text(
        label,
        style: AppTextStyles.bodyMedium.copyWith(
          color: highlight ? Palette.medGreen : Palette.lightPurple,
          fontWeight: highlight ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }

  List<LinearShapePointer> _buildMarkerPointers() {
    return [
      const LinearShapePointer(
        value: 1,
        shapeType: LinearShapePointerType.rectangle,
        width: 1,
        offset: 5,
        position: LinearElementPosition.inside,
      ),
      const LinearShapePointer(
        value: 30,
        shapeType: LinearShapePointerType.rectangle,
        width: 1,
        offset: 5,
        position: LinearElementPosition.inside,
      ),
      const LinearShapePointer(
        value: 45,
        shapeType: LinearShapePointerType.rectangle,
        width: 1,
        offset: 5,
        position: LinearElementPosition.inside,
      ),
      const LinearShapePointer(
        value: 60,
        shapeType: LinearShapePointerType.rectangle,
        width: 1,
        offset: 5,
        position: LinearElementPosition.inside,
      ),
      const LinearShapePointer(
        value: 89,
        shapeType: LinearShapePointerType.rectangle,
        width: 1,
        offset: 5,
        position: LinearElementPosition.inside,
      ),
    ];
  }
}
