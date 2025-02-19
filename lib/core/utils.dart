import 'dart:ui';

Color hexToColor(String code) {
  String hexCode = code.replaceAll('0x', '');
  if (hexCode.length == 6) {
    hexCode = 'FF' + hexCode;
  }
  return Color(int.parse(hexCode, radix: 16));
}
