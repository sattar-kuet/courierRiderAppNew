import 'dart:convert';

import 'package:courier_rider/utility/apiroot.dart';
import 'package:courier_rider/utility/localDB.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/toast/gf_toast.dart';
import 'package:getwidget/position/gf_toast_position.dart';
import 'package:http/http.dart' as http;

class QrCodeProvider extends ChangeNotifier {
  void checkParcelStatusAction(BuildContext context, String data) async {
    http.Response response = await ApiRoot.apiRequest(
      {"uid": LocalDB.getUID},
      url: 'parcel/detail/$data',
    );
    bool status = json.decode(response.body)['result']['status'];

    if (status == true) {
      // ignore: use_build_context_synchronously
      Navigator.of(context)
          .pushReplacementNamed('/parceldetails', arguments: int.parse(data));
    } else {
      // ignore: use_build_context_synchronously
      GFToast.showToast(
        json.decode(response.body)['result']['message'],
        context,
        toastPosition: GFToastPosition.BOTTOM,
        backgroundColor: Colors.red,
      );
    }
  }
}
