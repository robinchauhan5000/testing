import 'package:flutter/cupertino.dart';

class SizeConfig {
  static MediaQueryData _mediaQueryData;
  static double screenWidth;
  static double screenHeight;
  static double blockSizeHorzontal;
  static double blockSizeVertical;

  void getSize(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenHeight = _mediaQueryData.size.height;
    screenWidth = _mediaQueryData.size.width;
    blockSizeVertical = screenHeight / 100;
    blockSizeHorzontal = screenWidth / 100;
  }
}
