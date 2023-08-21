import 'dart:convert';

import 'package:courier_rider/utility/apiroot.dart';
import 'package:courier_rider/utility/localdb.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ParcelActionDialogMethod {
  static Future<String> otpSentMethod({required String phone}) async {
    http.Response response = await ApiRoot.apiRequest({
      'phone': phone,
      'message': "",
    }, url: 'sendotp');

    if (response.statusCode == 200) {
      return json.decode(response.body)['result']['otp'];
    } else {
      return "";
    }
  }

  static Future<bool> merchantRejectParcelMethod({
    required int parcelID,
    required String note,
  }) async {
    http.Response response = await ApiRoot.apiRequest({
      "uid": LocalDB.getUID,
      "parcel_id": parcelID,
      "reject_note": note,
    }, url: 'rider/parcel/merchant_reject');

    if (response.statusCode == 200) {
      debugPrint("--------- merchant Reject Parcel Success -----------");
      return true;
    } else {
      debugPrint("--------- merchant Reject Parcel Failure -----------");
      return false;
    }
  }

  static Future<bool> parcelPickupMethod({
    required int parcelID,
  }) async {
    http.Response response = await ApiRoot.apiRequest({
      "uid": LocalDB.getUID,
      "parcel_id": parcelID,
    }, url: 'rider/parcel/pickup_done');
    print(json.decode(response.body));
    if (response.statusCode == 200) {
      debugPrint("---------  Parcel Pickup Success -----------");
      return true;
    } else {
      debugPrint("--------- Parcel Pickup Failure -----------");
      return false;
    }
  }

  static Future<bool> parcelReturnMethod({
    required int parcelID,
  }) async {
    http.Response response = await ApiRoot.apiRequest({
      "uid": LocalDB.getUID,
      "parcel_id": parcelID,
    }, url: 'rider/parcel/return_done');
    print(json.decode(response.body));
    if (response.statusCode == 200) {
      debugPrint("---------  Parcel Return Success -----------");
      return true;
    } else {
      debugPrint("--------- Parcel Return Failure -----------");
      return false;
    }
  }

  static Future<bool> customerRejectParcelMethod({
    required int parcelID,
    required String note,
  }) async {
    http.Response response = await ApiRoot.apiRequest({
      "uid": LocalDB.getUID,
      "parcel_id": parcelID,
      "reject_note": note,
    }, url: 'rider/parcel/customer_reject');

    if (response.statusCode == 200) {
      debugPrint("--------- Customer Reject Parcel Success -----------");
      return true;
    } else {
      debugPrint("--------- Customer Reject Parcel Failure -----------");
      return false;
    }
  }

  static Future<bool> parcelRescheduleMethod(
      {required int parcelID,
      required String note,
      required String date}) async {
    http.Response response = await ApiRoot.apiRequest({
      "uid": LocalDB.getUID,
      "parcel_id": parcelID,
      "reschedule_at": date,
      "reschedule_note": note
    }, url: 'rider/parcel/reschedule');

    if (response.statusCode == 200) {
      debugPrint("--------- Reschedule Parcel Success -----------");
      return true;
    } else {
      debugPrint("--------- Reschedule Parcel Failure -----------");
      return false;
    }
  }

  static Future<bool> parcelDeliveryMethod({
    required int parcelID,
    required String type,
    required int cashcollection,
    required String partialNote,
    required String exchangeNote,
  }) async {
    http.Response response = await ApiRoot.apiRequest({
      "uid": LocalDB.getUID,
      "parcel_id": parcelID,
      "cash_collection": cashcollection,
      "delivery_type": type,
      "partial_note": partialNote,
      "exchange_note": exchangeNote,
    }, url: 'rider/parcel/set_as_delivered');

    if (response.statusCode == 200) {
      debugPrint("--------- Parcel Delivery Success -----------");
      return true;
    } else {
      debugPrint("--------- Parcel Delivery Failure -----------");
      return false;
    }
  }
}
