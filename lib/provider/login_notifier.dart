import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:practice/ui/screens/main_dashboard_screen.dart';

import '../repo/login_api.dart';

class LoginNotifier extends ChangeNotifier {
  var _deviceId;

  get deviceId => _deviceId;

  login(
      {String email,
      String password,
      String deviceInfo,
      BuildContext context}) {
    LoginApi.login(email, password, deviceInfo).then((value) => {
          if (value)
            {
              Navigator.pushNamed(context, MainDashBoardScreen.route),
            }
          else
            {
              Fluttertoast.showToast(
                  msg: 'Login',
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  textColor: Colors.black,
                  backgroundColor: Colors.red)
            }
        });

    notifyListeners();
  }

  getDeviceID() async {
    var deviceInfo = DeviceInfoPlugin();
    if (Platform.isIOS) {
      _deviceId = await deviceInfo.iosInfo;
      notifyListeners();
    } else {
      _deviceId = await deviceInfo.androidInfo;
      notifyListeners();
    }
  }
}
