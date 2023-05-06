import 'package:courier_rider/components/inputBox/inputBox.dart';
import 'package:courier_rider/page/PhoneVerify/Provider/PhoneVerifyProvider.dart';
import 'package:courier_rider/utility/extension.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body:
          Consumer<PhoneVerifyProvider>(builder: (context, stateAction, child) {
        return SafeArea(
          child: SizedBox(
            width: 100.w,
            height: 100.h,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GFImageOverlay(
                    width: 40.w,
                    height: 40.w,
                    boxFit: BoxFit.contain,
                    colorFilter: const ColorFilter.mode(
                        Colors.transparent, BlendMode.colorBurn),
                    image: const AssetImage('assets/logo/logo.png'),
                  ).displayAnimated(const Duration(milliseconds: 300)),
                  Text(
                    "আপনার ফোন নাম্বার যাচাই করুন",
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(fontSize: 15.sp),
                  ).displayAnimated(const Duration(milliseconds: 300)),
                  SizedBox(
                    height: 20.sp,
                  ),
                  InputBox(
                    controller: stateAction.controller,
                    hintText: '1XXXXXXXXX',
                    prefix: const Text("880 "),
                    onChanage: (String value) =>
                        Provider.of<PhoneVerifyProvider>(context, listen: false)
                          ..onChange(value),
                  ).displayAnimated(const Duration(milliseconds: 300)),
                  SizedBox(
                    height: 50.sp,
                  ),
                  GFButton(
                    size: GFSize.LARGE,
                    onPressed: !stateAction.btnEnable
                        ? null
                        : () => Provider.of<PhoneVerifyProvider>(context,
                            listen: false)
                          ..otpSendAction(
                            context,
                            phone: stateAction.controller.value.text,
                          ),
                    disabledColor: Colors.grey,
                    text: "SENT OTP",
                    textStyle: TextStyle(fontSize: 14.sp),
                    shape: GFButtonShape.standard,
                    color: Theme.of(context).colorScheme.primary,
                    padding: EdgeInsets.symmetric(horizontal: 25.sp),
                  ).displayAnimated(const Duration(milliseconds: 300)),
                  SizedBox(
                    height: 20.h,
                  ),
                ],
              ),
            ),
          ),
        ).loading(context, stateAction.isLoading);
      }),
    );
  }
}
