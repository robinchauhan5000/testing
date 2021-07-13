import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:practice/ui/screens/main_dashboard_screen.dart';

class LoginAPi {
  signIn({String email, String password, id, BuildContext context}) async {
    print(email + password);
    try {
      final respons = await http.post(
          Uri.parse(
              'https://ankit.parastechnologies.in/nucleus_app/public/api/login-user'),
          body: {'email': email, 'password': password, 'device_id': id});
      print(respons.statusCode);

      if (respons.statusCode == 200) {
        Navigator.pushNamed(context, MainDashBoardScreen.route);
        final responseJson = jsonDecode(respons.body);
        print(responseJson);
        Fluttertoast.showToast(
            msg: 'Login',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            textColor: Colors.black,
            backgroundColor: Colors.red);
      } else {
        Fluttertoast.showToast(
            msg: 'Please Check Login Crendential',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            textColor: Colors.black,
            backgroundColor: Colors.red);
      }
    } catch (e) {
      print(e);
    }
  }
}
