import 'package:flutter/material.dart';
import 'package:social_app/core/constants/color_constants.dart';
import 'package:social_app/core/constants/spacing_constants.dart';
import 'package:social_app/core/constants/typo_constants.dart';

ThemeData buildLightTheme() {
  final ThemeData base = ThemeData(
    primarySwatch: accentBlueMaterial,
    scaffoldBackgroundColor: white,
  );
  return base.copyWith(
    primaryColor: accentBlue,
    focusColor: accentBlue60,
    inputDecorationTheme: InputDecorationTheme(
      fillColor: white,
      filled: true,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(standartRadius),
      ),
      labelStyle: body,
      hintStyle: headline3,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(standartRadius),
        borderSide: BorderSide(color: accentBlue),
      ),
    ),
  );
}
