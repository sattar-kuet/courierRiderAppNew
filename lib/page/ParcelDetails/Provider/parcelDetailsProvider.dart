import 'package:courier_rider/page/ParcelDetails/method/parcelDetails.dart';
import 'package:courier_rider/page/ParcelDetails/model/parcelDetailsModel.dart';
import 'package:flutter/material.dart';

class ParcelDetailsProvider extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  ParcelDetailsModel _parcelDetails = ParcelDetailsModel();
  ParcelDetailsModel get parcelDetails => _parcelDetails;

  void parcelDetailsAction(int id) async {
    _isLoading = true;
    notifyListeners();

    ParcelDetailsModel parcel =
        await ParcelDetailsMethod.parcelDetailsMethod(id);
    print(parcel);

    _parcelDetails = parcel;
    _isLoading = false;
    notifyListeners();
  }
}
