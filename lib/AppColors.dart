import 'package:flutter/material.dart';

class AppColors {
  static const mainColor = Color(0XFFe5eefc);
  static const styleColor = Color(0XFF6f7e96);
  static const activeColor = Color(0XFFd0ddf3);
  static const lightBlue = Color(0XFF92aeff);
  static const darkBlue = Color(0XFF5880ff);
  static const lightBlueShadow = Color(0XAA92aeff);

  static const lightTxt = Color(0XFFe9eaee);
  static const color2 = Color(0XFFcc98bb);
  static const color3 = Color(0XFF62a5ae);
  static const color4 = Color(0XFFda99a2);
  static const color5 = Color(0XFFf27552);
  static const color6 = Color(0XFF0b354a);
  static const darkTxt = Color(0XFF080d34);
  static const brownTxt = Color(0XFF505243);
  static const rewardid = "ca-app-pub-6011809596899441/8900475532";
  static const testRewardid = "ca-app-pub-3940256099942544/5224354917";

  static const colorList = [color2,color3,color4,color6,color6];




  static final  lLightTheme = ThemeData(backgroundColor: AppColors.mainColor,cardColor: lightBlue,shadowColor: lightBlueShadow
      ,textTheme: TextTheme(headline1:TextStyle(color: AppColors.styleColor),
          headline2: TextStyle(color: AppColors.activeColor)));
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