import 'dart:math';
import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xffFFD4D5);
  static MaterialColor primarySwatch = createMaterialColor(primary);
  static const Color bgColor = Color(0xffFFD8D9);
  static const Color fillColor = Color(0xffFFEFEF);
  static const Color stroke = Color(0xffFFD5D6);
  static const Color indicator = Color(0xffFF7979);

  // static const Color primary50 = Color(0xffffe7e8);
  // static const Color primary100 = Color(0xffffe5e6);
  // static const Color primary200 = Color(0xffffe1e2);
  // static const Color primary300 = Color(0xffffdddd);
  // static const Color primary400 = Color(0xffffd8d9);
  // static const Color primary500 = Color(0xffffd4d5);
  // static const Color primary600 = Color(0xffe5bfc0);
  // static const Color primary700 = Color(0xffccaaaa);
  // static const Color primary800 = Color(0xffb29495);
  // static const Color primary900 = Color(0xff997f80);

  static MaterialColor createMaterialColor(Color color) {
    List strengths = <double>[.05];
    Map<int, Color> swatch = <int, Color>{};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    // print(strengths);
    for (var strength in strengths) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    }
    // print(swatch);
    return MaterialColor(color.value, swatch);
  }

  static const Color whiteBg = Color.fromARGB(255, 245, 245, 245);
  static const Color bottomBar = Color(0xffFFD4D5);
  static const Color bottomBarSelected = Colors.red;

  static Color textColor(Color color) {
    return color.computeLuminance() > 0.5
        ? const Color(0xff3D3D3D)
        : Colors.white;
  }
}
