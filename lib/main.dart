import 'package:flutter/material.dart';
import 'package:practice/ui/screens/login_screen.dart';
import 'package:practice/ui/screens/main_dashboard_screen.dart';
import 'package:provider/provider.dart';

import 'provider/login_notifier.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LoginNotifier(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          primarySwatch: Colors.blue,
        ),
        home: LoginScreen(),
        routes: {
          MainDashBoardScreen.route: (context) => MainDashBoardScreen(),
        },
      ),
    );
  }
}
