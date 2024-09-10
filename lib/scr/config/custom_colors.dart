import 'package:flutter/material.dart';

Map<int, Color> _swatchOpacity = {
  50: const Color.fromRGBO(73, 184, 105, .1),
  100: const Color.fromRGBO(73, 184, 105, .2),
  200: const Color.fromRGBO(73, 184, 105, .3),
  300: const Color.fromRGBO(73, 184, 105, .4),
  400: const Color.fromRGBO(73, 184, 105, .5),
  500: const Color.fromRGBO(73, 184, 105, .6),
  600: const Color.fromRGBO(73, 184, 105, .7),
  700: const Color.fromRGBO(73, 184, 105, .8),
  800: const Color.fromRGBO(73, 184, 105, .9),
  900: const Color.fromRGBO(73, 184, 105, 1),
};

abstract class CustomColors {
  static Color customContrastColor = _swatchOpacity[200]!;

  static MaterialColor customSwatchColor =
      MaterialColor(0xFF49b869, _swatchOpacity);

  // static Color secondaryGreen = const Color.fromRGBO(73, 184, 105, .4);
  static Color secondaryGreen = const Color(0xffffffff);
}
