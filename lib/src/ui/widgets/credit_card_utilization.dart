import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meetava_pro/src/providers/credit_utilization_provider.dart';
import 'package:meetava_pro/src/providers/linear_shape_pointer_provider.dart';
import 'package:meetava_pro/src/ui/widgets/doughnut_series_widget.dart';
import 'package:meetava_pro/src/ui/widgets/white_rounded_constainer.dart';
import 'package:meetava_pro/src/util/color_palette.dart';
import 'package:meetava_pro/src/util/constants.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import '../../models/doughnut_series_model.dart';
import 'package:intl/intl.dart';

class CreditCardUtilization extends ConsumerWidget {
  const CreditCardUtilization({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(creditUtilizationNotifierProvider);
    final creditCardUtilizationNotifier =
        ref.read(creditUtilizationNotifierProvider.notifier);
    final seriesData = {
      creditCardUtilizationNotifier.category: creditCardUtilizationNotifier.rate
    };

    final rate = creditCardUtilizationNotifier.rate;

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
                  seriesData: seriesData, startAngle: 0, endAngle: 360),
            ),
          ],
        ),
        AppGaps.vSmallGap,
        SfLinearGauge(
            minimum: 0,
            maximum: 90,
            showAxisTrack: false,
            showTicks: false,
            showLabels: false,
            ranges: [
              LinearGaugeRange(
                  edgeStyle: LinearEdgeStyle.startCurve,
                  startWidth: AppSizes.spaceXL,
                  endWidth: AppSizes.spaceXL,
                  startValue: 0,
                  endValue: 30,
                  color: Colors.transparent,
                  position: LinearElementPosition.outside,
                  child: rate <= 29
                      ? Center(
                          child: Text(
                            'Excellent',
                            style: AppTextStyles.bodyLarge.copyWith(
                                color: Palette.medGreen,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      : Container()),
              LinearGaugeRange(
                  startWidth: AppSizes.spaceXL,
                  endWidth: AppSizes.spaceXL,
                  startValue: 30,
                  endValue: 60,
                  color: Colors.transparent,
                  position: LinearElementPosition.outside,
                  child: rate > 29 && rate <= 49
                      ? Center(
                          child: Text(
                            'Good',
                            style: AppTextStyles.bodyLarge.copyWith(
                                color: Palette.lightYellow,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      : Container()),
              LinearGaugeRange(
                  startWidth: AppSizes.spaceXL,
                  endWidth: AppSizes.spaceXL,
                  startValue: 60,
                  endValue: 90,
                  color: Colors.transparent,
                  position: LinearElementPosition.outside,
                  child: rate > 49 && rate <= 75
                      ? Center(
                          child: Text(
                            'Poor',
                            style: AppTextStyles.bodyLarge.copyWith(
                                color: Palette.lightRed,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      : Container())
            ]),
        SfLinearGauge(
          minimum: 0,
          maximum: 90,
          showAxisTrack: false,
          showTicks: false,
          showLabels: false,
          ranges: const [
            LinearGaugeRange(
              edgeStyle: LinearEdgeStyle.startCurve,
              startWidth: AppSizes.spaceXL,
              endWidth: AppSizes.spaceXL,
              startValue: 0,
              endValue: 30,
              color: Palette.medGreen,
              position: LinearElementPosition.outside,
            ),
            LinearGaugeRange(
              startWidth: AppSizes.spaceXL,
              endWidth: AppSizes.spaceXL,
              startValue: 30,
              endValue: 60,
              color: Palette.lightYellow,
              position: LinearElementPosition.outside,
            ),
            LinearGaugeRange(
              edgeStyle: LinearEdgeStyle.endCurve,
              startWidth: AppSizes.spaceXL,
              endWidth: AppSizes.spaceXL,
              startValue: 60,
              endValue: 90,
              color: Palette.lightRed,
              position: LinearElementPosition.outside,
            )
          ],
          markerPointers: _generateMarkerPointers(ref),
        ),
        SfLinearGauge(
          minimum: 0,
          maximum: 90,
          showAxisTrack: false,
          showTicks: false,
          showLabels: false,
          ranges: [
            LinearGaugeRange(
              edgeStyle: LinearEdgeStyle.startCurve,
              startWidth: AppSizes.spaceXL,
              endWidth: AppSizes.spaceXL,
              startValue: 0,
              endValue: 30,
              color: Colors.transparent,
              position: LinearElementPosition.outside,
              child: Row(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '0-9%',
                      style: AppTextStyles.bodyLarge.copyWith(
                          color: rate <= 9
                              ? Palette.medGreen
                              : Palette.lightPurple,
                          fontWeight:
                              rate <= 9 ? FontWeight.bold : FontWeight.normal),
                    ),
                  ),
                  const Expanded(child: AppGaps.hHugeGap),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      '10-29%',
                      style: AppTextStyles.bodyLarge.copyWith(
                          color: rate > 9 && rate <= 29
                              ? Palette.medGreen
                              : Palette.lightPurple,
                          fontWeight: rate > 9 && rate <= 29
                              ? FontWeight.bold
                              : FontWeight.normal),
                    ),
                  )
                ],
              ),
            ),
            LinearGaugeRange(
              startWidth: AppSizes.spaceXL,
              endWidth: AppSizes.spaceXL,
              startValue: 30,
              endValue: 60,
              color: Colors.transparent,
              position: LinearElementPosition.outside,
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  '30-49%',
                  style: AppTextStyles.bodyLarge.copyWith(
                      color: rate > 29 && rate <= 49
                          ? Palette.lightYellow
                          : Palette.lightPurple,
                      fontWeight: rate > 29 && rate <= 49
                          ? FontWeight.bold
                          : FontWeight.normal),
                ),
              ),
            ),
            LinearGaugeRange(
              startWidth: AppSizes.spaceXL,
              endWidth: AppSizes.spaceXL,
              startValue: 60,
              endValue: 90,
              color: Colors.transparent,
              position: LinearElementPosition.outside,
              child: Row(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '50-74%',
                      style: AppTextStyles.bodyLarge.copyWith(
                          color: rate > 49 && rate <= 74
                              ? Palette.lightRed
                              : Palette.lightPurple,
                          fontWeight: rate > 49 && rate <= 74
                              ? FontWeight.bold
                              : FontWeight.normal),
                    ),
                  ),
                  Expanded(child: AppGaps.hHugeGap),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      '<74%',
                      style: AppTextStyles.bodyLarge.copyWith(
                          color: rate > 74
                              ? Palette.lightRed
                              : Palette.lightPurple,
                          fontWeight:
                              rate > 74 ? FontWeight.bold : FontWeight.normal),
                    ),
                  )
                ],
              ),
            )
          ],
        )

        /* _buildGaugeWithLabels(rate),
        _buildColoredGauge(),
        _buildPercentageLabels(rate), */
      ],
    ));
  }

  List<LinearGaugeRange> test(){
    return [];
  }

  List<LinearShapePointer> _generateMarkerPointers(WidgetRef ref) {
    final linearShapePointerProvider =
        ref.watch(linearShapePointerNotifierProvider);
    final linearShapePointerNotifier =
        ref.read(linearShapePointerNotifierProvider.notifier);

    return linearShapePointerProvider
        .map((data) => LinearShapePointer(
              value: data.value.toDouble(),
              height: AppSizes.spaceSmall,
              shapeType: LinearShapePointerType.rectangle,
              width: 1,
              offset: AppSizes.spaceXS,
              color: linearShapePointerNotifier.getColor(data.value,
                  ref), //rate <= 9 ? Palette.medGreen : Palette.lightPurple,
              position: LinearElementPosition.inside,
            ))
        .toList();
  }

  Widget _utilizationHeader(WidgetRef ref) {
    final creditCardUtilizationProvider =
        ref.watch(creditUtilizationNotifierProvider);
    ref.read(creditUtilizationNotifierProvider.notifier);
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

  TextSpan _buildTextSpan(String text, TextStyle style) {
    return TextSpan(
      text: text,
      style: style,
    );
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
