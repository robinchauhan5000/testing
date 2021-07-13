import 'dart:convert';

import 'package:http/http.dart';
import 'package:practice/repo/all_api_url.dart';

class LoginApi {
  static Future login(String email, String password, var deviceInfo) async {
    try {
      final Response repspons =
          await post(Uri.parse(AllAPIURL.login_url), body: {
        'email': email,
        'password': password,
        'device_id': deviceInfo,
      });

      if (repspons.statusCode == 200) {
        final jsonRespons = jsonDecode(repspons.body);
        print(jsonRespons);
        return jsonRespons;
      }
    } catch (error) {}
  }
}
