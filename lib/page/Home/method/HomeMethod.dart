import 'package:courier_rider/page/Home/model/HomeModel.dart';
import 'package:courier_rider/utility/apiroot.dart';
import 'package:courier_rider/utility/extension.dart';
import 'package:courier_rider/utility/localDB.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class HomeMethod {
  static Future<List<TransactionModel>> transactionHomeAction() async {
    try {
      http.Response response = await ApiRoot.apiRequest(
        {
          'uid': LocalDB.getUID,
          "start_date": "2000-02-14",
          "end_date": DateFormat('yyyy-MM-dd').format(DateTime.now())
        },
        url: 'rider/transaction/stat',
      );
      if (response.statusCode == 200) {
        debugPrint("---------- Transaction Home Data get -----------");

        return response.body.transactionJsonConvert;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return [];
  }

  static Future<List<RiderHomeParcelModel>> parcelHomeAction() async {
    try {
      http.Response response = await ApiRoot.apiRequest(
        {
          'uid': LocalDB.getUID,
          "start_date": "2000-02-14",
          "end_date": DateFormat('yyyy-MM-dd').format(DateTime.now())
        },
        url: 'rider/parcel/stat',
      );
      if (response.statusCode == 200) {
        debugPrint("---------- Parcel Home Data get -----------");

        return response.body.parcelModelJsonConvert;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return [];
  }
}
