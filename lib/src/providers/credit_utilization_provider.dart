import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../src.dart';
part 'credit_utilization_provider.g.dart';

@riverpod
class CreditUtilizationNotifier extends _$CreditUtilizationNotifier {
  @override
  CreditCardUtilizationModel build() {
    return CreditCardUtilizationModel(
      totalBalance: 10000,
      totalLimit: 200900,
    );
  }

  int get rate =>
      MathUtils.calculatePercentage(state.totalBalance, state.totalLimit)
          .toInt();

  
  List<Color> get gaugeColors =>
      [Palette.medGreen, Palette.lightYellow, Palette.lightRed];

  Color tickColor(double value) {
    if (rate < 9 && value == 0.0) {
      return Palette.medGreen;
    } else if (value == 30.0 && rate >= 9 && rate <= 29) {
      return Palette.medGreen;
    } else if (value == 45.0 && rate > 29 && rate <= 49) {
      return Palette.lightYellow;
    } else if (value == 60.0 && rate > 49 && rate <= 74) {
      return Palette.lightRed;
    } else if (value == 90.0 && rate > 75) {
      return Palette.lightRed;
    } else {
      return Palette.lightPurple;
    }
  }

  List<double> get tickValues {
    return [0.0, 30.0, 45.0, 60.0, 90.0];
  }

  String get category {
    if (rate <= 29) {
      return 'Excellent';
    } else if (rate <= 50) {
      return 'Good';
    } else {
      return 'Poor';
    }
  }

  Color get color {
    if (rate <= 29) {
      return Palette.medGreen;
    } else if (rate <= 50) {
      return Palette.lightYellow;
    } else {
      return Palette.lightRed;
    }
  }

  double get range {
    if (rate <= 29) {
      return 0.0;
    } else if (rate <= 50) {
      return 30.0;
    } else {
      return 60.0;
    }
  }

  Map<String, List<double>> labelMap = {
    '0-9%': [0, 30],
    '10-29%': [0, 30],
    '30-49%': [30, 60],
    '50-74%': [60, 90],
    '>74%': [60, 90],
  };

  Map<String, dynamic> getColorAndAlignment(String label) {
    Color color;
    Alignment alignment;

    switch (label) {
      case '0-9%':
        color = rate <= 9 ? Palette.medGreen : Palette.lightPurple;
        alignment = Alignment.centerLeft;
        break;
      case '10-29%':
        color = rate > 9 && rate <= 29 ? Palette.medGreen : Palette.lightPurple;
        alignment = Alignment.centerRight;
        break;
      case '30-49%':
        color =
            rate > 29 && rate <= 49 ? Palette.lightYellow : Palette.lightPurple;
        alignment = Alignment.center;
        break;
      case '50-74%':
        color =
            rate > 49 && rate <= 74 ? Palette.lightRed : Palette.lightPurple;
        alignment = Alignment.centerLeft;
        break;
      case '>74%':
        color = rate > 74 ? Palette.lightRed : Palette.lightPurple;
        alignment = Alignment.centerRight;
        break;
      default:
        color = Palette.lightPurple;
        alignment = Alignment.center;
        break;
    }

    return {'color': color, 'alignment': alignment};
  }
}
