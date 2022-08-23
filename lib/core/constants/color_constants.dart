// ignore_for_file: use_full_hex_values_for_flutter_colors

import 'package:flutter/material.dart';

Color accentBlue = const Color(0xffff554af0);
MaterialColor accentBlueMaterial = MaterialColor(0xffff554af0, accentBlueMap);
Color accentBlue80 = const Color(0xffff554af0).withOpacity(0.8);
Color accentBlue60 = const Color(0xffff554af0).withOpacity(0.6);
Color accentBlue30 = const Color(0xffff554af0).withOpacity(0.3);
Color accentBlue10 = const Color(0xffff554af0).withOpacity(0.1);

// Text Colors
Color dark = const Color(0xFF04021D);
Color dark80 = const Color(0xFF04021D).withOpacity(0.8);
Color dark60 = const Color(0xFF04021D).withOpacity(0.6);
Color dark30 = const Color(0xFF04021D).withOpacity(0.3);

// Status Colors
Color dangerous = const Color(0xFFFF0000);
Color bad = const Color(0xFFFF6B00);
Color good = const Color(0xFF15AA2C);

//Background Colors
Color white = const Color(0xFFFFFFFF);
Color extraWhite = const Color(0xFFF8F8FA);

//Button Colors
Color accentActive = const Color(0xFF2113E8);
Color secondaryActive = const Color(0xFF6D61F2);

Map<int, Color> accentBlueMap = {
  50: Color(0xffff554af0).withOpacity(0.1),
  100: Color(0xffff554af0).withOpacity(0.2),
  200: Color(0xffff554af0).withOpacity(0.3),
  300: Color(0xffff554af0).withOpacity(0.4),
  400: Color(0xffff554af0).withOpacity(0.5),
  500: Color(0xffff554af0).withOpacity(0.6),
  600: Color(0xffff554af0).withOpacity(0.7),
  700: Color(0xffff554af0).withOpacity(0.8),
  800: Color(0xffff554af0).withOpacity(0.9),
  900: Color(0xffff554af0).withOpacity(1),
};
