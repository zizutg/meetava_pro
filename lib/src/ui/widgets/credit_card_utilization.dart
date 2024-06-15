import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meetava_pro/src/ui/widgets/doughnut_series_widget.dart';
import 'package:meetava_pro/src/ui/widgets/white_rounded_constainer.dart';
import '../../models/doughnut_series_model.dart';

class CreditCardUtilization extends ConsumerWidget {
  const CreditCardUtilization({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return WhiteRoundedConstainer(
        child: DoughnutSeriesWidget(
      seriesModel: DoughnutSeriesModel(),
    ));
  }
}
