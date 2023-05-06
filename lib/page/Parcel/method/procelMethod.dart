import 'dart:convert';

import 'package:courier_rider/page/Parcel/model/parcelModel.dart';
import 'package:courier_rider/utility/apiroot.dart';
import 'package:courier_rider/utility/extension.dart';
import 'package:courier_rider/utility/localdb.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ParcelMethod {
  static Future<List<ParcelListModel>> parcelListMethod() async {
    try {
      http.Response response = await ApiRoot.apiRequest({
        "param": "",
        "status": "",
        "start_date": "1971-01-01",
        "end_date": "".datetimeFormate
      }, url: 'parcel/list/${LocalDB.getUID}');

      if (response.statusCode == 200) {
        debugPrint("------------ Parcel List get Success -------------");

        return response.body.parcelListJsonConvert;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return [];
  }
}
