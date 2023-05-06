import 'package:courier_rider/page/Parcel/method/procelMethod.dart';
import 'package:courier_rider/page/Parcel/model/parcelModel.dart';
import 'package:flutter/material.dart';

class ParcelProvider extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  List<ParcelListModel> _parcelList = [];
  List<ParcelListModel> get parcelList => _parcelList;

  void parcelListAction() async {
    _isLoading = true;
    notifyListeners();
    await ParcelMethod.parcelListMethod().then((value) {
      if (value.isNotEmpty) {
        _parcelList = value;
        notifyListeners();
      }
      _isLoading = false;
      notifyListeners();
    });
  }
}
