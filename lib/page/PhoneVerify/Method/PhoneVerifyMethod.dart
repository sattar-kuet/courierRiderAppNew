import 'dart:convert';

import 'package:courier_rider/page/PhoneVerify/Provider/Model/PhoneVerifyModel.dart';
import 'package:courier_rider/utility/apiroot.dart';
import 'package:courier_rider/utility/config.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PhoneVerifyMethod {
  static Future<UserExistsModel?> userExistsCheckAction(
      {required String phone}) async {
    try {
      dynamic payload = {'phone': phone};
      print(payload);
      http.Response response =
          await ApiRoot.apiRequest(payload, url: 'user/is_exist');
      print("json.decode(response.body) ???????????????????????? >>>>>");
      print(json.decode(response.body));
      if (response.statusCode == 200) {
        return UserExistsModel.fromJson(json.decode(response.body)['result']);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }

  static Future<bool> phoneSmsSendAction(String phone, String? otp) async {
    try {
      http.Response response = await ApiRoot.apiRequest(
          {'phone': phone, 'message': 'This is your OTP:  $otp'},
          url: 'password/sendotp');
      if (response.statusCode == 200) {
        debugPrint("-----------OTP Send success--------");
        return true;
      } else {
        debugPrint('---------- OTP Sent Error -----------');
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return false;
  }
}
