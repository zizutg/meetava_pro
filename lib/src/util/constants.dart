import 'dart:math';
import 'package:flutter/material.dart';
import 'package:meetava_pro/src/util/color_palette.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'constants.g.dart';

// ignore: constant_identifier_names
const ROUNDED_RECTANGLE_BORDER = RoundedRectangleBorder(
    borderRadius: BorderRadius.vertical(bottom: Radius.circular(25)));

const TextTheme avaTextTheme = TextTheme(
  displayLarge: TextStyle(
      fontSize: 32.0, fontWeight: FontWeight.bold, color: Palette.darkPurple),
  displayMedium: TextStyle(
      fontSize: 28.0, fontWeight: FontWeight.bold, color: Palette.deepPurple),
  displaySmall: TextStyle(
      fontSize: 24.0, fontWeight: FontWeight.normal, color: Palette.darkPurple),
  headlineLarge: TextStyle(
      fontSize: 20.0, fontWeight: FontWeight.bold, color: Palette.darkPurple),
  headlineMedium: TextStyle(
      fontSize: 18.0, fontWeight: FontWeight.bold, color: Palette.deepPurple),
  headlineSmall: TextStyle(
      fontSize: 16.0, fontWeight: FontWeight.bold, color: Palette.medPurple),
  titleLarge: TextStyle(
      fontSize: 16.0, fontWeight: FontWeight.normal, color: Palette.darkPurple),
  titleMedium: TextStyle(
      fontSize: 14.0, fontWeight: FontWeight.normal, color: Palette.deepPurple),
  titleSmall: TextStyle(
      fontSize: 12.0, fontWeight: FontWeight.normal, color: Palette.medPurple),
  bodyLarge: TextStyle(
      fontSize: 14.0, fontWeight: FontWeight.normal, color: Palette.deepPurple),
  bodyMedium: TextStyle(
      fontSize: 12.0, fontWeight: FontWeight.normal, color: Palette.medPurple),
  bodySmall: TextStyle(
      fontSize: 10.0,
      fontWeight: FontWeight.normal,
      color: Palette.lightPurple),
  labelLarge: TextStyle(
      fontSize: 14.0, fontWeight: FontWeight.bold, color: Palette.deepPurple),
  labelMedium: TextStyle(
      fontSize: 12.0, fontWeight: FontWeight.bold, color: Palette.medPurple),
  labelSmall: TextStyle(
      fontSize: 10.0, fontWeight: FontWeight.bold, color: Palette.lightPurple),
);

@riverpod
TextTheme textTheme(ref) => avaTextTheme.apply(fontFamily: 'AtHaussAero');

const smallGap = SizedBox(height: 8);
const medGap = SizedBox(height: 16);
const largeGap = SizedBox(height: 24);
const hugeGap = SizedBox(height: 32);
