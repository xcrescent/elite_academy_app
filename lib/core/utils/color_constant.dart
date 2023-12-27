import 'dart:ui';
import 'package:flutter/material.dart';

class ColorConstant {
  static Color black9007f = fromHex('#7f000000');

  static Color green300 = fromHex('#89c06f');

  static Color gray5001 = fromHex('#f8f9fa');

  static Color gray5002 = fromHex('#f6f7fb');

  static Color black9003d = fromHex('#3d000000');

  static Color black900B2 = fromHex('#b2000000');

  static Color gray80049 = fromHex('#493c3c43');

  static Color blueA200 = fromHex('#588af1');

  static Color red400 = fromHex('#f14a60');

  static Color black90001 = fromHex('#000919');

  static Color blue20087 = fromHex('#87a6c8ff');

  static Color black90000 = fromHex('#00000000');

  static Color yellow800 = fromHex('#d4ab1b');

  static Color teal900 = fromHex('#072d4b');

  static Color blueGray90001 = fromHex('#2e3637');

  static Color blueGray700 = fromHex('#424c5d');

  static Color blueGray900 = fromHex('#262b35');

  static Color deepPurpleA200 = fromHex('#735bf2');

  static Color black90003 = fromHex('#0b0a0a');

  static Color black90002 = fromHex('#090b0d');

  static Color redA20001 = fromHex('#ff4b4b');

  static Color black9004c = fromHex('#4c000000');

  static Color gray600 = fromHex('#777777');

  static Color blueGray100 = fromHex('#d6dae2');

  static Color black9004d = fromHex('#4d000000');

  static Color blue700 = fromHex('#1976d2');

  static Color blueGray300 = fromHex('#9ea8ba');

  static Color redA200 = fromHex('#fd6161');

  static Color gray800 = fromHex('#424242');

  static Color blueGray40090 = fromHex('#9074839d');

  static Color gray60026 = fromHex('#266d6d6d');

  static Color gray80099 = fromHex('#993c3c43');

  static Color blue50 = fromHex('#e0ebff');

  static Color indigo400 = fromHex('#4168d7');

  static Color black90099 = fromHex('#99000000');

  static Color black90011 = fromHex('#11000000');

  static Color gray10001 = fromHex('#f2f2f2');

  static Color black90019 = fromHex('#19000000');

  static Color blueGray40002 = fromHex('#888888');

  static Color blueGray40001 = fromHex('#75839d');

  static Color whiteA700 = fromHex('#ffffff');

  static Color blueGray50 = fromHex('#eaecf0');

  static Color red700 = fromHex('#d03329');

  static Color blueGray10087 = fromHex('#87ced3de');

  static Color blueA700 = fromHex('#0061ff');

  static Color blueGray10001 = fromHex('#dad6d6');

  static Color gray60019 = fromHex('#197e7e7e');

  static Color green600 = fromHex('#349765');

  static Color blueA70001 = fromHex('#0068ff');

  static Color gray50 = fromHex('#f9fbff');

  static Color blueGray80002 = fromHex('#37334d');

  static Color black90066 = fromHex('#66000000');

  static Color black900 = fromHex('#000000');

  static Color blueA20001 = fromHex('#4d90ff');

  static Color yellow900 = fromHex('#ec8c32');

  static Color blueGray800 = fromHex('#3d455b');

  static Color blue5002 = fromHex('#eef4ff');

  static Color blue5001 = fromHex('#e0ecff');

  static Color gray70011 = fromHex('#11555555');

  static Color indigoA20033 = fromHex('#334871e3');

  static Color gray700 = fromHex('#666666');

  static Color blueGray200 = fromHex('#bac1ce');

  static Color blueGray400 = fromHex('#74839d');

  static Color blue800 = fromHex('#2953c7');

  static Color indigo50 = fromHex('#e9eef8');

  static Color blueGray600 = fromHex('#5f6c86');

  static Color gray900 = fromHex('#2a2a2a');

  static Color gray90001 = fromHex('#0d1624');

  static Color blueA2004c = fromHex('#4c4d90ff');

  static Color blueGray30087 = fromHex('#87919eab');

  static Color blueGray80001 = fromHex('#363853');

  static Color gray300 = fromHex('#dfe1e5');

  static Color blueGray30001 = fromHex('#8f9bb3');

  static Color gray30001 = fromHex('#d2efe0');

  static Color gray100 = fromHex('#f4f5f7');

  static Color whiteA70000 = fromHex('#00ffffff');

  static Color indigo100 = fromHex('#b7c5dc');

  static Color black90033 = fromHex('#33000000');

  static Color blueGray1004c = fromHex('#4cd9d9d9');

  static Color indigo900 = fromHex('#002055');

  static Color blue200 = fromHex('#a6c8ff');

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
