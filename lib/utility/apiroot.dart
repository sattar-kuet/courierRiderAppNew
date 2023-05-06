import 'dart:convert';

import 'package:courier_rider/utility/config.dart';
import 'package:courier_rider/utility/localDB.dart';
import 'package:http/http.dart' as http;

class ApiRoot {
  static Future<http.Response> apiRequest(
    dynamic body, {
    required String url,
    bool isEmpty = false,
  }) async {
    http.Response response = await http.post(Uri.parse(baseUrl + "/$url"),
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
          'Cookie': 'session_id=${LocalDB.getToken}'
        },
        body: isEmpty ? json.encode({}) : json.encode({"params": body}));
    return response;
  }
}
