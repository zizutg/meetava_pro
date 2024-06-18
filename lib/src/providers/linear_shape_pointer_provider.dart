import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meetava_pro/src/models/linear_shape_pointer_model.dart';
import 'package:meetava_pro/src/providers/credit_score_provider.dart';
import 'package:meetava_pro/src/providers/credit_utilization_provider.dart';
import 'package:meetava_pro/src/util/color_palette.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'linear_shape_pointer_provider.g.dart';

@riverpod
class LinearShapePointerNotifier extends _$LinearShapePointerNotifier {
  @override
  List<LinearShapePointerModel> build() {
    return [
      LinearShapePointerModel(value: 0),
      LinearShapePointerModel(value: 30),
      LinearShapePointerModel(value: 45),
      LinearShapePointerModel(value: 60),
      LinearShapePointerModel(value: 90)
    ];
  }

  Color getColor(int value, WidgetRef ref) {
    final creditUtilizationNotifier =
        ref.read(creditUtilizationNotifierProvider.notifier);
    final rate = creditUtilizationNotifier.rate;

    switch (value) {
      case 0:
        return rate < 9 ? Palette.medGreen : Palette.lightPurple;
      case 30:
        return rate > 9 && rate <= 29 ? Palette.medGreen : Palette.lightPurple;
      case 45:
        return rate > 29 && rate <= 49 ? Palette.medGreen : Palette.lightPurple;
      case 60:
        return rate > 49 && rate <= 74
            ? Palette.lightYellow
            : Palette.lightPurple;
      case 90:
        return rate > 74 ? Palette.medGreen : Palette.lightPurple;
      default:
        return Colors.transparent;
    }
  }
}
