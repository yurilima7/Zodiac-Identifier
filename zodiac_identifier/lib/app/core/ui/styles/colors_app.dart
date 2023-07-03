import 'package:flutter/material.dart';

class ColorsApp {
  static ColorsApp? _instance;

  ColorsApp._();
  static ColorsApp get i {
    _instance ??= ColorsApp._();
    return _instance!;
  }

  Color get primary => const Color(0XFFEAD6FF);
  Color get secundary => const Color(0XFF5900B3);
  Color get tertiary => const Color(0XFF0F001F);
  Color get colorError => Colors.redAccent;
}

extension ColorAppExtensions on BuildContext {
  ColorsApp get colors => ColorsApp.i;
}