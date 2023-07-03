import 'package:flutter/material.dart';
import 'package:zodiac_identifier/app/core/ui/styles/colors_app.dart';

class TextApp {
  static TextApp? _instance;

  TextApp._();
  static TextApp get i {
    _instance ??= TextApp._();
    return _instance!;
  }

  String get font => 'K2D';

  TextStyle get primaryRegular => TextStyle(
      fontFamily: font,
      color: ColorsApp.i.tertiary,
      fontSize: 14,
      fontWeight: FontWeight.normal,);

  TextStyle get titleMedium => TextStyle(
        fontFamily: font,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      );

  TextStyle get titleButton => TextStyle(
        fontFamily: font,
        color: ColorsApp.i.primary,
        fontSize: 16,
        fontWeight: FontWeight.w600,
      );

  TextStyle get titleAppBar => TextStyle(
        fontFamily: font,
        color: ColorsApp.i.primary,
        fontSize: 22,
        fontWeight: FontWeight.bold,
      );

  TextStyle get appBar => titleMedium.copyWith(color: ColorsApp.i.primary);
  TextStyle get titleConstellation => titleMedium.copyWith(color: ColorsApp.i.tertiary, fontSize: 18);
  TextStyle get constellationInfo => titleMedium.copyWith(color: ColorsApp.i.tertiary, fontSize: 14,);
}

extension TextAppExtensions on BuildContext {
  TextApp get text => TextApp.i;
}
