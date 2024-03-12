import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Palette {
  static Color white = HexColor.fromHex('#ffffff');
  static Color black = HexColor.fromHex('#000000');
  static Color primaryBackground = HexColor.fromHex('#5D2EC0');
  static Color primary = HexColor.fromHex('#F9902D');

  static Color primaryButtonColor = HexColor.fromHex('#E7AB00');

  static Color headingcolor = HexColor.fromHex('#627485');
  static Color authorColor = HexColor.fromHex('#F67903');
}

extension HexColor on Color {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}
