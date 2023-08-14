import 'package:courier_rider/page/PhoneVerify/Provider/Model/PhoneVerifyModel.dart';
import 'package:courier_rider/page/Login/Provider/LoginProvider.dart';
import 'package:courier_rider/utility/extension.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class LoginWithOtpView extends StatelessWidget {
  const LoginWithOtpView({super.key});

  @override
  Widget build(BuildContext context) {
    final Map data = ModalRoute.of(context)!.settings.arguments as Map;
    final UserExistsModel routerData = data['data'] as UserExistsModel;
    final String phone = data['phone'] as String;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: GFAppBar(title: const Text("Verify OTP")),
      body: Consumer<LoginProvider>(builder: (context, stateAction, child) {
        return SafeArea(
          child: SizedBox(
            height: 100.h,
            width: 100.w,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/logo/logo.png',
                      width: 30.w,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: '880$phone ',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.bold,
                            ),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'দয়া করে এই ফোন নাম্বারটি চেক করুন',
                            style:
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      fontSize: 15.sp,
                                    ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    otpField(
                      context,
                      (String otp) => Provider.of<LoginProvider>(context,
                          listen: false)
                        ..otpVerifyWithLoginAction(context, routerData, otp),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                  ]),
            ),
          ),
        ).loading(context, stateAction.isLoading);
      }),
    );
  }
}
