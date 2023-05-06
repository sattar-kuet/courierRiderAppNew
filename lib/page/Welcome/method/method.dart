import 'dart:convert';

import 'package:courier_rider/utility/apiroot.dart';
import 'package:courier_rider/utility/localdb.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class WelcomeMethod {
  static void dbNameAction() async {
    try {
      http.Response response =
          await ApiRoot.apiRequest({}, url: 'db_name', isEmpty: true);
      if (response.statusCode == 200) {
        LocalDB.setDB(json.decode(response.body)['result']['db']);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  static Future<bool> checkTokenStatus() async {
    try {
      http.Response response =
          await ApiRoot.apiRequest({}, url: 'session/check', isEmpty: true);
      print(json.decode(response.body));
      if (response.statusCode == 200) {
        return json.decode(response.body)['result']['status'];
      }
      return false;
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }
}
