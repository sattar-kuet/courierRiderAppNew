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
      http.Response response = await ApiRoot.apiRequest({'phone': "880$phone"},
          url: 'user/is_exist');
      if (response.statusCode == 200) {
        return UserExistsModel.fromJson(json.decode(response.body)['result']);
      }
      print(json.decode(response.body));
      
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }

  static Future<bool> phoneSmsSendAction(String phone, String code) async {
    try {
      http.Response response = await ApiRoot.apiRequest(
          {'phone': "880$phone", 'message': otpMessage + code},
          url: 'sendotp');
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
