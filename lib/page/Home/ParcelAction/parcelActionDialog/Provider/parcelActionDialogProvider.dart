import 'package:courier_rider/page/Home/ParcelAction/parcelActionDialog/method/parcelActionDialogMethod.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class ParcelActionDialogProvider extends ChangeNotifier {
  int _rediogroupValue = 0;
  int get radiogroupValue => _rediogroupValue;

  TextEditingController noteController = TextEditingController();
  TextEditingController exchangeNoteController = TextEditingController();
  TextEditingController partialNoteController = TextEditingController();

  TextEditingController cashCollectionController = TextEditingController();

  String _date = "";
  String get date => _date;

  String _time = "";
  String get time => _time;

  bool _btnEnable = false;
  bool get btnEnable => _btnEnable;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  // bool _isVerify = false; TODO: if you want to send code to merchant to verify  set it as false
  bool _isVerify = true;
  bool get isVerify => _isVerify;

  String _otp = "";
  String get otp => _otp;

  void initialization(String taka, bool hasExchange) {
    cashCollectionController = TextEditingController(text: taka);
    buttonEnable(hasExchange);
    notifyListeners();
  }

  void buttonEnable(bool hasExchange) {
    if (hasExchange && exchangeNoteController.text.isEmpty) {
      _btnEnable = false;
    } else if (radiogroupValue != 0 && partialNoteController.text.isEmpty) {
      _btnEnable = false;
    } else if (cashCollectionController.text.isEmpty) {
      _btnEnable = false;
    } else {
      _btnEnable = true;
    }
    notifyListeners();
  }

  void redioOnChange(int value) {
    _rediogroupValue = value;
    notifyListeners();
  }

  void cashCollectionFullAction(String taka) {
    cashCollectionController = TextEditingController(text: taka);
    notifyListeners();
  }

  void cashCollectionClearAction(String taka) {
    cashCollectionController = TextEditingController();
    notifyListeners();
  }

  void merchantRejectOTPVerifyAction(String phone) async {
    try {
      _isLoading = true;
      notifyListeners();
      _otp = await ParcelActionDialogMethod.otpSentMethod(phone: phone);
      debugPrint(_otp);
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void merchantOTPVerifyAction(BuildContext context, String otp) {
    if (otp == _otp) {
      _isVerify = true;
      GFToast.showToast(
        'OTP Verify Success',
        context,
        backgroundColor: Colors.green,
        toastPosition: GFToastPosition.BOTTOM,
      );
      notifyListeners();
    } else {
      GFToast.showToast(
        'OTP Verify Failure',
        context,
        backgroundColor: Colors.red,
        toastPosition: GFToastPosition.BOTTOM,
      );
      notifyListeners();
    }
  }

  void noteOnChangeAction() {
    if (noteController.value.text.isNotEmpty) {
      _btnEnable = true;
      notifyListeners();
    } else {
      _btnEnable = false;
      notifyListeners();
    }
  }

  

  void dateTimeOnChangeAction() {
    if (noteController.value.text.isNotEmpty &&
        _date.isNotEmpty &&
        _time.isNotEmpty) {
      _btnEnable = true;
      notifyListeners();
    } else {
      _btnEnable = false;
      notifyListeners();
    }
  }

  void merchantRejectParcel(
    BuildContext context, {
    required int parcelID,
    required String note,
  }) {
    _isLoading = true;
    notifyListeners();
    ParcelActionDialogMethod.merchantRejectParcelMethod(
      parcelID: parcelID,
      note: note,
    ).then((value) {
      if (value == true) {
        GFToast.showToast(
          'Parcel Reject Success',
          context,
          backgroundColor: Colors.green,
          toastPosition: GFToastPosition.BOTTOM,
        );

        Navigator.of(context).pushNamedAndRemoveUntil('/', (route) => false);
      } else {
        GFToast.showToast(
          'Parcel Reject Failure',
          context,
          backgroundColor: Colors.red,
          toastPosition: GFToastPosition.BOTTOM,
        );
      }
      _isLoading = false;
      notifyListeners();
    });
  }

  void parcelPickupAction(
    BuildContext context, {
    required int parcelID,
  }) {
    _isLoading = true;
    notifyListeners();
    ParcelActionDialogMethod.parcelPickupMethod(
      parcelID: parcelID,
    ).then((value) {
      if (value == true) {
        GFToast.showToast(
          'Parcel Pickup Success',
          context,
          backgroundColor: Colors.green,
          toastPosition: GFToastPosition.BOTTOM,
        );
        Navigator.of(context).pushNamedAndRemoveUntil('/', (route) => false);
      } else {
        GFToast.showToast(
          'Parcel Pickup Failure',
          context,
          backgroundColor: Colors.red,
          toastPosition: GFToastPosition.BOTTOM,
        );
      }
      _isLoading = false;
      notifyListeners();
    });
  }

  void parcelreturnAction(
    BuildContext context, {
    required int parcelID,
  }) {
    _isLoading = true;
    notifyListeners();
    ParcelActionDialogMethod.parcelReturnMethod(
      parcelID: parcelID,
    ).then((value) {
      if (value == true) {
        GFToast.showToast(
          'Parcel Return Success',
          context,
          backgroundColor: Colors.green,
          toastPosition: GFToastPosition.BOTTOM,
        );
        Navigator.of(context).pushNamedAndRemoveUntil('/', (route) => false);
      } else {
        GFToast.showToast(
          'Parcel Return Failure',
          context,
          backgroundColor: Colors.red,
          toastPosition: GFToastPosition.BOTTOM,
        );
      }
      _isLoading = false;
      notifyListeners();
    });
  }

  void customerRejectParcel(
    BuildContext context, {
    required int parcelID,
    required String note,
  }) {
    _isLoading = true;
    notifyListeners();
    ParcelActionDialogMethod.customerRejectParcelMethod(
      parcelID: parcelID,
      note: note,
    ).then((value) {
      if (value == true) {
        GFToast.showToast(
          'Parcel Reject Success',
          context,
          backgroundColor: Colors.green,
          toastPosition: GFToastPosition.BOTTOM,
        );

        Navigator.of(context).pushNamedAndRemoveUntil('/', (route) => false);
      } else {
        GFToast.showToast(
          'Parcel Reject Failure',
          context,
          backgroundColor: Colors.red,
          toastPosition: GFToastPosition.BOTTOM,
        );
      }
      _isLoading = false;
      notifyListeners();
    });
  }

  void reScheduleParcelAction(BuildContext context,
      {required int parcelID, required String note, required String datetime}) {
    _isLoading = true;
    notifyListeners();
    // print("datetime   >>>>>>>>>>>>>>>>>> ????????????");
    // print(datetime);
    ParcelActionDialogMethod.parcelRescheduleMethod(
      parcelID: parcelID,
      note: note,
      date: datetime,
    ).then((value) {
      if (value == true) {
        GFToast.showToast(
          'Schedule Parcel Success',
          context,
          backgroundColor: Colors.green,
          toastPosition: GFToastPosition.BOTTOM,
        );

        Navigator.of(context).pushNamedAndRemoveUntil('/', (route) => false);
      } else {
        GFToast.showToast(
          'Schedule Parcel Failure',
          context,
          backgroundColor: Colors.red,
          toastPosition: GFToastPosition.BOTTOM,
        );
      }
      _isLoading = false;
      notifyListeners();
    });
  }

  void updateDate(String date) {
    _date = date;
    notifyListeners();
  }

  void updateTime(String time) {
    _time = time;
    notifyListeners();
  }

  void parcelDeliveryAction(BuildContext context,
      {required int parcelID,
      required String type,
      required int cashcollection,
      required String partialNote,
      required String exchangeNote}) {
    _isLoading = true;
    notifyListeners();
    ParcelActionDialogMethod.parcelDeliveryMethod(
            parcelID: parcelID,
            type: type,
            cashcollection: cashcollection,
            partialNote: partialNote,
            exchangeNote: exchangeNote,)
        .then((value) {
      if (value == true) {
        GFToast.showToast(
          'Parcel delivered successfully',
          context,
          backgroundColor: Colors.green,
          toastPosition: GFToastPosition.BOTTOM,
        );

        Navigator.of(context).pushNamedAndRemoveUntil('/', (route) => false);
      } else {
        GFToast.showToast(
          'Parcel delivery Failure',
          context,
          backgroundColor: Colors.red,
          toastPosition: GFToastPosition.BOTTOM,
        );
      }
      _isLoading = false;
      notifyListeners();
    });
  }

  @override
  void dispose() {
    _otp = '';
    noteController.dispose();
    cashCollectionController.dispose();
    super.dispose();
  }
}
