import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meetava_pro/src/models/credit_card_factor_model.dart';
import 'package:meetava_pro/src/providers/credit_card_factor_provider.dart';
import 'package:meetava_pro/src/ui/widgets/credit_factor_card.dart';
import 'package:meetava_pro/src/ui/widgets/base_header.dart';
import 'package:meetava_pro/src/ui/widgets/section_header.dart';
import 'package:meetava_pro/src/util/color_palette.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import '../../util/constants.dart';
import 'package:faker/faker.dart';

class MeetAvaHome extends ConsumerWidget {
  const MeetAvaHome({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final creditCardFactors = ref.watch(creditCardFactorNotifierProvider);
    final monthlyScores = ref.watch(monthlyScoresProvider);
    return Scaffold(
      appBar: AppBar(
          //shape: ROUNDED_RECTANGLE_BORDER,
          leading: IconButton(
              onPressed: () {
                // To do implement the route here
              },
              icon: const Icon(
                Icons.settings_outlined,
                color: Colors.white,
              )),
          title: const Text(
            'Home',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Palette.deepPurple),
      body: SingleChildScrollView(
          child: Column(
        children: [
          const BaseHeaderWidget(),
          const SectionHeader(title: 'Chart'),
          SizedBox(
            height: 128,
            child: Center(
                child: SfCartesianChart(
              plotAreaBorderWidth: 0,
              primaryXAxis: const NumericAxis(
                isVisible: false,
              ),
              primaryYAxis: const NumericAxis(
                axisLine: AxisLine(width: 0),
                majorTickLines: MajorTickLines(width: 0),
                minimum: 300,
                maximum: 850,
              ),
              tooltipBehavior: TooltipBehavior(enable: true),
              series: [
                LineSeries<int, int>(
                  color: Palette.medGreen,
                  dataSource: monthlyScores,
                  xValueMapper: (int value, int index) => index + 1,
                  yValueMapper: (int value, int index) => value,
                  markerSettings: MarkerSettings(
                    isVisible: true,
                  ),
                  //dataLabelSettings: DataLabelSettings(isVisible: false),
                  animationDuration: 3000, // Animation duration in milliseconds
                )
              ],
            )),
          ),
          const SectionHeader(title: 'Credit factors'),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: creditCardFactors.map((factor) {
                return CreditFactorCard(creditFactorModel: factor);
              }).toList(),
            ),
          ),
          const SectionHeader(title: 'Account details'),
          const SectionHeader(title: 'Open credit card accounts'),
        ],
      )),
    );
  }
}

class BottomCurvedClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 20);
    path.quadraticBezierTo(
        size.width / 4, size.height, size.width / 2, size.height);
    path.quadraticBezierTo(
        size.width * 3 / 4, size.height, size.width, size.height - 20);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
