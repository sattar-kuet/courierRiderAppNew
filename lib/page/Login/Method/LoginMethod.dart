import 'dart:convert';

import 'package:courier_rider/page/PhoneVerify/Provider/Model/PhoneVerifyModel.dart';
import 'package:courier_rider/utility/apiroot.dart';
import 'package:courier_rider/utility/extension.dart';
import 'package:courier_rider/utility/localdb.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginMethod {
  static Future<bool> loginAccountAction({
    required UserExistsModel data,
  }) async {
    http.Response response = await ApiRoot.apiRequest(
      {"db": LocalDB.getDB, "login": data.login, "password": data.newPassword},
      url: 'web/session/authenticate',
    );
    if (response.statusCode == 200) {
      LocalDB.setToken(response.headers['set-cookie'].cookieFilter);
      LocalDB.setUID(response.body.uidFilter);
      return true;
    }
    debugPrint(response.statusCode.toString());
    return false;
  }
}
