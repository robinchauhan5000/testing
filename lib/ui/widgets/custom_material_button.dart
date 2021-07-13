import 'package:flutter/material.dart';

class CustomMaterialButton extends StatelessWidget {
  String buttonTitle;
  double fontsize, height, width;
  Color color;
  Function onPress;

  CustomMaterialButton(
      {@required this.buttonTitle,
      @required this.width,
      @required this.height,
      @required this.fontsize,
      @required this.color,
      @required this.onPress});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPress,
      child: Text(
        buttonTitle,
        style: TextStyle(color: Colors.white, fontSize: fontsize),
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      color: color,
      elevation: 3,
      height: height,
      minWidth: width,
    );
  }
}
