import 'package:courier_rider/page/PhoneVerify/Provider/Model/PhoneVerifyModel.dart';
import 'package:courier_rider/page/Login/Method/LoginMethod.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class LoginProvider extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void otpVerifyWithLoginAction(
    BuildContext context,
    UserExistsModel data,
    String otp,
  ) {
    _isLoading = true;
    notifyListeners();
    if (data.newPassword == otp) {
      GFToast.showToast(
        'Otp Verify Success',
        context,
        toastPosition: GFToastPosition.BOTTOM,
      );
      LoginMethod.loginAccountAction(data: data).then((bool value) {
        if (value == true) {
          GFToast.showToast(
            'Login Success',
            context,
            toastPosition: GFToastPosition.BOTTOM,
          );
          _isLoading = false;
          notifyListeners();
          Navigator.of(context).pushNamedAndRemoveUntil('/', (route) => false);
        } else {
          GFToast.showToast(
            'Login Failure',
            context,
            toastPosition: GFToastPosition.BOTTOM,
            backgroundColor: Colors.red,
          );
          _isLoading = false;
          notifyListeners();
        }
      });
    } else {
      GFToast.showToast(
        'Otp Verify Failure',
        context,
        toastPosition: GFToastPosition.BOTTOM,
        backgroundColor: Colors.red,
      );
      _isLoading = false;
      notifyListeners();
    }
  }
}
