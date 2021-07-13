import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';
import 'package:practice/apis/loginapi.dart';
import 'package:practice/ui/widgets/custom_material_button.dart';
import 'package:practice/ui/widgets/custom_text_filed.dart';
import 'package:practice/utils/size_config.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email;

  String password;

  var id;

  var login = LoginAPi();

  @override
  Widget build(BuildContext context) {
    SizeConfig().getSize(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: [
            CircleAvatar(
              radius: 30,
              child: Icon(Icons.watch),
            ),
            Text(
              'Welcome Back!',
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: SizeConfig.blockSizeHorzontal * 6),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Stay signed in with your account to make\nsearch easier',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: SizeConfig.blockSizeVertical * 3),
              ),
            ),
            loginForm(
                hint: 'Email',
                placeHolder: 'Email',
                function: (value) {
                  setState(() {
                    email = value;
                  });
                },
                showObsecure: false),
            SizedBox(
              height: 10,
            ),
            loginForm(
                hint: 'password',
                placeHolder: 'Password',
                function: (value) {
                  setState(() {
                    password = value;
                  });
                },
                showObsecure: true),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                  alignment: Alignment.topLeft, child: Text('keep me sign in')),
            ),
            SizedBox(
              height: 10,
            ),
            CustomMaterialButton(
                buttonTitle: 'Sign in',
                fontsize: 15,
                height: 80,
                width: SizeConfig.screenWidth * 0.8,
                color: Color(0xffFC7863),
                onPress: () async {
                  var deviceInfo = DeviceInfoPlugin();
                  if (Platform.isIOS) {
                    // import 'dart:io'
                    var iosDeviceInfo = await deviceInfo.iosInfo;
                    print(iosDeviceInfo.identifierForVendor);
                    await login.signIn(
                        email: email,
                        password: password,
                        id: iosDeviceInfo.identifierForVendor);
                    return iosDeviceInfo
                        .identifierForVendor; // unique ID on iOS
                  } else {
                    var androidDeviceInfo = await deviceInfo.androidInfo;
                    print(androidDeviceInfo.androidId);
                    print(email + password);
                    await login.signIn(
                        email: email,
                        password: password,
                        id: androidDeviceInfo.id);
                    return androidDeviceInfo.androidId; // unique ID on Android
                  }
                }),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Forget Password',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Create new account',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w700),
                  ),
                )
              ],
            ),
            Text(
              'Or use Our Social Media',
              style: TextStyle(fontWeight: FontWeight.w600, color: Colors.grey),
            ),
            SizedBox(
              height: SizeConfig.blockSizeVertical * 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomMaterialButton(
                    buttonTitle: 'G',
                    fontsize: SizeConfig.blockSizeHorzontal * 8,
                    height: 80,
                    width: SizeConfig.screenWidth * 0.3,
                    color: Color(0xffF3574C),
                    onPress: () {}),
                CustomMaterialButton(
                    buttonTitle: 'f',
                    fontsize: SizeConfig.blockSizeHorzontal * 8,
                    height: 80,
                    width: SizeConfig.screenWidth * 0.3,
                    color: Color(0xff4987FF),
                    onPress: () {}),
              ],
            )
          ],
        ),
      ),
    );
  }

  // Login form
  loginForm(
      {String placeHolder, String hint, Function function, bool showObsecure}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            placeHolder,
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
          SizedBox(
            height: 10,
          ),
          CustomTextFiled(
            hint: hint,
            function: function,
            showObsecureIcon: showObsecure,
          )
        ],
      ),
    );
  }
}
