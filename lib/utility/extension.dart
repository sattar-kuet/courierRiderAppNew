import 'dart:convert';
import 'dart:typed_data';
import 'package:courier_rider/page/Parcel/model/parcelModel.dart';
import 'package:intl/intl.dart';
import 'package:courier_rider/page/Home/model/HomeModel.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:overlay_loader_with_app_icon/overlay_loader_with_app_icon.dart';
import 'package:sizer/sizer.dart';

extension Packages on dynamic {
  dynamic displayAnimated(Duration duration) {
    return DelayedDisplay(delay: duration, child: this);
  }

  dynamic loading(BuildContext context, bool status) {
    return OverlayLoaderWithAppIcon(
      isLoading: status,
      borderRadius: 20,
      appIcon: Image.asset('assets/logo/logo.png'),
      overlayBackgroundColor: Theme.of(context).colorScheme.primaryContainer,
      circularProgressColor: Theme.of(context).colorScheme.primary,
      child: this,
    );
  }

  Widget otpField(BuildContext context, Function(String pin) onCompleted) {
    return OTPTextField(
      length: 6,
      width: MediaQuery.of(context).size.width,
      fieldWidth: 10.w,
      style: const TextStyle(fontSize: 17),
      onChanged: (String value) {},
      textFieldAlignment: MainAxisAlignment.spaceBetween,
      fieldStyle: FieldStyle.underline,
      onCompleted: (String pin) => onCompleted(pin),
    );
  }
}

extension SystemInfo on dynamic {
  String get cookieFilter {
    // filter Response Header Cookie
    return ((this as String).split(';')[0]).split("=")[1];
  }

  int get uidFilter {
    return json.decode(this)['result']['uid'];
  }

  List<TransactionModel> get transactionJsonConvert {
    return (json.decode(this)['result']['data'] as List)
        .map((e) => TransactionModel.fromJson(e))
        .toList();
  }

  List<RiderHomeParcelModel> get parcelModelJsonConvert {
    return (json.decode(this)['result']['data'] as List)
        .map((e) => RiderHomeParcelModel.fromJson(e))
        .toList();
  }

  List<ParcelListModel> get parcelListJsonConvert {
    return (json.decode(this)['result']['data'] as List)
        .map((e) => ParcelListModel.fromJson(e))
        .toList();
  }

  Uint8List get memoryImage {
    return base64Decode(this);
  }

  String get datetimeFormate {
    return DateFormat('yyyy-MM-dd').format(DateTime.now());
  }

  int get parcelCashLength {
    return int.parse(
      this.parcelDetails.cash!.length.toString(),
    );
  }

  String get deliveryAreaCustomer {
    List listdata = this.parcelDetails.customer!.address.toString().split(',');
    return listdata[listdata.length - 2].toString().trim();
  }

  String get deliveryAreaMerchant {
    List listdata = this.parcelDetails.customer!.address.toString().split(',');
    return listdata[listdata.length - 2].toString().trim();
  }
}
