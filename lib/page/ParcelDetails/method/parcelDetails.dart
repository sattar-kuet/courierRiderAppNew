import 'dart:convert';

import 'package:courier_rider/page/ParcelDetails/model/parcelDetailsModel.dart';
import 'package:courier_rider/utility/apiroot.dart';
import 'package:courier_rider/utility/localdb.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ParcelDetailsMethod {
  static Future<ParcelDetailsModel> parcelDetailsMethod(int id) async {
    try {
      http.Response response = await ApiRoot.apiRequest(
        {"uid": LocalDB.getUID},
        url: 'parcel/detail/$id',
      );

      if (response.statusCode == 200) {
        debugPrint("------------ Parcel Details get Success -------------");
        return ParcelDetailsModel.fromJson(
            json.decode(response.body)['result']['data']);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return ParcelDetailsModel();
  }
}
