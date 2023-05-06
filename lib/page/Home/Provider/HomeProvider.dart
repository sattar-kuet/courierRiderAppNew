import 'package:courier_rider/page/Home/method/HomeMethod.dart';
import 'package:courier_rider/page/Home/model/HomeModel.dart';
import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  List<RiderHomeParcelModel> _riderParcel = [];
  List<RiderHomeParcelModel> get riderParcel => _riderParcel;

  List<TransactionModel> _transactions = [];
  List<TransactionModel> get transactions => _transactions;

  void riderParcelHomeacton() {
    HomeMethod.parcelHomeAction().then((value) {
      if (value.isNotEmpty) {
        _riderParcel = value;
        notifyListeners();
      }
    });
  }

  void transactionHomeAction() {
    HomeMethod.transactionHomeAction().then((value) {
      if (value.isNotEmpty) {
        _transactions = value;
        notifyListeners();
      }
    });
  }

  @override
  void dispose() {
    _transactions = [];
    super.dispose();
  }
}
