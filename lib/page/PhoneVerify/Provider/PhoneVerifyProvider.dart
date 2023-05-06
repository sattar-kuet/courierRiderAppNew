import 'package:courier_rider/page/PhoneVerify/Provider/Model/PhoneVerifyModel.dart';
import 'package:courier_rider/utility/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:getwidget/getwidget.dart';
import '../Method/PhoneVerifyMethod.dart';

class PhoneVerifyProvider extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  bool _btnEnable = false;
  bool get btnEnable => _btnEnable;
  final TextEditingController _controller = TextEditingController();
  TextEditingController get controller => _controller;

  // Phone Number Validation Function
  void onChange(dynamic value) {
    RegExp regExp = RegExp(phoneRegExp);

    if (regExp.hasMatch(value)) {
      controller.clear();
      notifyListeners();
    }
    if (value.length == 10) {
      _btnEnable = true;
      notifyListeners();
    } else {
      _btnEnable = false;
      notifyListeners();
    }
  }

// API Call Function Secation Start
  void otpSendAction(BuildContext context, {required String phone}) async {
    SystemChannels.textInput.invokeMethod('TextInput.hide');

    _isLoading = true;
    notifyListeners();

    // User exists or not action Method
    UserExistsModel? code =
        await PhoneVerifyMethod.userExistsCheckAction(phone: phone);

    // otp Send action Method
    PhoneVerifyMethod.phoneSmsSendAction(phone, code!.newPassword.toString())
        .then((bool value) {
      if (value) {
        GFToast.showToast(
          'Otp Sent Success',
          context,
          toastPosition: GFToastPosition.BOTTOM,
        );
        Navigator.of(context)
            .pushNamed('/otp', arguments: {'phone': phone, 'data': code});
      }
      _isLoading = false;
      notifyListeners();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
