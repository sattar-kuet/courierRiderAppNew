import 'package:courier_rider/page/Home/ParcelAction/parcelActionDialog/Provider/parcelActionDialogProvider.dart';
import 'package:courier_rider/utility/extension.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class PickupParcelDialog extends StatefulWidget {
  const PickupParcelDialog({
    super.key,
    required this.phone,
    required this.parcelId,

  });
  final String phone;
  final int parcelId;


  @override
  State<PickupParcelDialog> createState() => _PickupParcelState();
}

class _PickupParcelState extends State<PickupParcelDialog> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ParcelActionDialogProvider(),
      child: Consumer<ParcelActionDialogProvider>(
          builder: (context, stateAction, __) {
        return Scaffold(
            appBar: AppBar(
              title: const Text("Parcel Pickup"),
              backgroundColor: Colors.green,
            ),
            body: SafeArea(
              child: SizedBox(
                width: 100.w,
                height: 100.h,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: stateAction.isVerify
                        ? [
                            SizedBox(
                              width: 50.w,
                              height: 12.w,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.green,
                                ),
                                onPressed: () =>
                                    Provider.of<ParcelActionDialogProvider>(
                                        context,
                                        listen: false)
                                      ..parcelPickupAction(
                                        context,
                                        parcelID: widget.parcelId,
                                      ),
                                child: Text(
                                  "Pickup Done",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                        fontSize: 15.sp,
                                        color: Colors.white,
                                      ),
                                ),
                              ),
                            ),
                          ]
                        : [
                            RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(fontSize: 15.sp),
                                children: [
                                  TextSpan(
                                    text: widget.phone,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .copyWith(
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                  const TextSpan(
                                      text: " এই ফোন নাম্বারটি যাচাই করুন"),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 30.sp,
                            ),
                            if (stateAction.otp.isEmpty) ...[
                              SizedBox(
                                width: 40.w,
                                height: 12.w,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.green,
                                  ),
                                  onPressed: () =>
                                      Provider.of<ParcelActionDialogProvider>(
                                          context,
                                          listen: false)
                                        ..merchantRejectOTPVerifyAction(
                                            widget.phone),
                                  child: Text(
                                    "Send OTP",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .copyWith(
                                          fontSize: 15.sp,
                                          color: Colors.white,
                                        ),
                                  ),
                                ),
                              ),
                            ] else ...[
                              otpField(
                                context,
                                (value) =>
                                    Provider.of<ParcelActionDialogProvider>(
                                        context,
                                        listen: false)
                                      ..merchantOTPVerifyAction(context, value),
                              ),
                            ]
                          ],
                  ),
                ),
              ),
            )).loading(context, stateAction.isLoading);
      }),
    );
  }
}
