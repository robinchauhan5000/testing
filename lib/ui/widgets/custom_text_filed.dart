import 'package:flutter/material.dart';

class CustomTextFiled extends StatefulWidget {
  String hint;
  Function function;
  bool showObsecureIcon;

  CustomTextFiled({this.function, this.hint, this.showObsecureIcon});

  @override
  _CustomTextFiledState createState() => _CustomTextFiledState();
}

class _CustomTextFiledState extends State<CustomTextFiled> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: TextField(
        style: TextStyle(color: Colors.black),
        cursorColor: Colors.black,
        decoration: InputDecoration(
            hintText: widget.hint,
            suffixIcon: widget.showObsecureIcon
                ? IconButton(
                    icon: Icon(Icons.thumb_up_alt_outlined), onPressed: () {})
                : Container(width: 0,),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
        onChanged: widget.function,
      ),
    );
  }
}
