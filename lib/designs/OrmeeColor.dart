import 'dart:core';
import 'package:flutter/material.dart';

final class OrmeeColor extends Color {
  OrmeeColor(super.value);

  static const Color black = Color.fromARGB(255, 0, 0, 0);
  static const Color white = Color.fromARGB(255, 255, 255, 255);
  static const Color error = Color.fromARGB(255, 240, 58, 46);

  static const Map<int, Color> grey = <int, Color>{
    5: Color.fromARGB(255, 247, 247, 248),
    10: Color.fromARGB(255, 232, 232, 234),
    20: Color.fromARGB(255, 203, 204, 209),
    30: Color.fromARGB(255, 181, 182, 188),
    40: Color.fromARGB(255, 127, 128, 135),
    50: Color.fromARGB(255, 105, 106, 115),
    60: Color.fromARGB(255, 89, 91, 102),
    70: Color.fromARGB(255, 70, 72, 84),
    80: Color.fromARGB(255, 40, 40, 47),
    90: Color.fromARGB(255, 21, 21, 23),
  };

  static const Map<int, Color> gray = <int, Color>{
    50: Color.fromARGB(255, 251, 251, 251),
    100: Color.fromARGB(255, 241, 242, 243),
    200: Color.fromARGB(255, 234, 235, 236),
    300: Color.fromARGB(255, 219, 220, 221),
    400: Color.fromARGB(255, 186, 188, 189),
    500: Color.fromARGB(255, 141, 142, 143),
    600: Color.fromARGB(255, 108, 109, 109),
    700: Color.fromARGB(255, 77, 78, 79),
    800: Color.fromARGB(255, 54, 54, 54),
    900: Color.fromARGB(255, 32, 33, 35)
  };

  static const Map<int, Color> primaryPuple = <int, Color>{
    10: Color.fromARGB(255, 242, 240, 255),
    50: Color.fromARGB(255, 236, 233, 255),
    100: Color.fromARGB(255, 206, 200, 253),
    200: Color.fromARGB(255, 173, 165, 252),
    300: Color.fromARGB(255, 139, 128, 251),
    400: Color.fromARGB(255, 114, 96, 248),
    500: Color.fromARGB(255, 97, 64, 233),
    600: Color.fromARGB(255, 92, 54, 221),
    700: Color.fromARGB(255, 84, 41, 207),
    800: Color.fromARGB(255, 78, 25, 193),
    900: Color.fromARGB(255, 68, 0, 169)
  };

  static const Map<int, Color> purple = <int, Color>{
    3: Color.fromARGB(255, 247, 245, 255),
    5: Color.fromARGB(255, 236, 233, 255),
    10: Color.fromARGB(255, 206, 200, 253),
    20: Color.fromARGB(255, 173, 165, 252),
    30: Color.fromARGB(255, 139, 128, 251),
    40: Color.fromARGB(255, 114, 96, 248),
    50: Color.fromARGB(255, 92, 54, 221),
    60: Color.fromARGB(255, 84, 41, 207),
    70: Color.fromARGB(255, 78, 25, 193),
    80: Color.fromARGB(255, 68, 0, 169)
  };

  static const Map<int, Color> systemGreen = <int, Color>{
    5: Color.fromARGB(255, 222, 245, 226),
    20: Color.fromARGB(255, 116, 211, 132),
    30: Color.fromARGB(255, 92, 184, 108)
  };

  static const Map<int, Color> systemRed = <int, Color>{
    5: Color.fromARGB(255, 251, 232, 232),
    20: Color.fromARGB(255, 233, 109, 109),
    30: Color.fromARGB(255, 206, 83, 83)
  };
}
