import 'package:courier_rider/components/inputBox/inputBox.dart';
import 'package:courier_rider/page/Home/ParcelAction/parcelActionDialog/Provider/parcelActionDialogProvider.dart';
import 'package:courier_rider/utility/extension.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/colors/gf_color.dart';
import 'package:getwidget/components/radio/gf_radio.dart';
import 'package:getwidget/size/gf_size.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class DeliveryDialog extends StatelessWidget {
  const DeliveryDialog({
    super.key,
    required this.phone,
    required this.parcelId,
    required this.taka,
    required this.hasExchange,
  });
  final String phone;
  final int parcelId;
  final int taka;
  final bool hasExchange;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ParcelActionDialogProvider()
        ..initialization(taka.toString(), hasExchange),
      child: Consumer<ParcelActionDialogProvider>(
          builder: (context, stateAction, __) {
        return Scaffold(
            appBar: AppBar(
              title: const Text("Parcel Delivery"),
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
                            Row(children: [
                              Row(children: [
                                GFRadio(
                                  size: GFSize.SMALL,
                                  value: 0,
                                  groupValue: stateAction.radiogroupValue,
                                  onChanged: (value) =>
                                      Provider.of<ParcelActionDialogProvider>(
                                    context,
                                    listen: false,
                                  )
                                        ..redioOnChange(value)
                                        ..buttonEnable(hasExchange)
                                        ..cashCollectionFullAction(
                                            taka.toString()),
                                  inactiveIcon: null,
                                  activeBorderColor: GFColors.SUCCESS,
                                  radioColor: GFColors.SUCCESS,
                                ),
                                SizedBox(
                                  width: 10.sp,
                                ),
                                Text(
                                  "Full",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(fontSize: 15.sp),
                                )
                              ]),
                              SizedBox(
                                width: 30.sp,
                              ),
                              Row(children: [
                                GFRadio(
                                  size: GFSize.SMALL,
                                  value: 1,
                                  groupValue: stateAction.radiogroupValue,
                                  onChanged: (value) =>
                                      Provider.of<ParcelActionDialogProvider>(
                                    context,
                                    listen: false,
                                  )
                                        ..redioOnChange(value)
                                        ..buttonEnable(hasExchange)
                                        ..cashCollectionClearAction(
                                            taka.toString()),
                                  inactiveIcon: null,
                                  activeBorderColor: GFColors.SUCCESS,
                                  radioColor: GFColors.SUCCESS,
                                ),
                                SizedBox(
                                  width: 10.sp,
                                ),
                                Text(
                                  "Partial",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(fontSize: 15.sp),
                                )
                              ]),
                            ]),
                            SizedBox(
                              height: 30.sp,
                            ),
                            InputBox(
                              controller: stateAction.cashCollectionController,
                              hintText: 'Cash Collection',
                              onChanage: (String value) {
                                stateAction.buttonEnable(hasExchange);
                              },
                              enable: true,
                              // enable: stateAction.radiogroupValue == 0
                              //     ? false
                              //     : true,
                            ),
                            SizedBox(
                              height: 30.sp,
                            ),
                            if (stateAction.radiogroupValue != 0)
                              InputBox(
                                controller: stateAction.partialNoteController,
                                hintText: 'Partial Note',
                                maxLength: 100,
                                onChanage: (String value) {
                                  stateAction.buttonEnable(hasExchange);
                                },
                                enable: true,
                                // enable: stateAction.radiogroupValue == 0
                                //     ? false
                                //     : true,
                              ),
                            SizedBox(
                              height: 30.sp,
                            ),
                            if (hasExchange)
                              InputBox(
                                controller: stateAction.exchangeNoteController,
                                maxLength: 100,
                                hintText: 'Exchange Note',
                                onChanage: (String value) {
                                  stateAction.buttonEnable(hasExchange);
                                },
                                enable: true,
                                // enable: stateAction.radiogroupValue == 0
                                //     ? false
                                //     : true,
                              ),
                            SizedBox(
                              height: 30.sp,
                            ),
                            SizedBox(
                              width: 50.w,
                              height: 12.w,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.green,
                                ),
                                onPressed: stateAction.btnEnable == false
                                    ? null
                                    : () =>
                                        Provider.of<ParcelActionDialogProvider>(
                                            context,
                                            listen: false)
                                          ..parcelDeliveryAction(
                                            context,
                                            type:
                                                stateAction.radiogroupValue == 0
                                                    ? 'full'
                                                    : 'partial',
                                            parcelID: parcelId,
                                            cashcollection: int.parse(
                                              stateAction
                                                  .cashCollectionController
                                                  .value
                                                  .text,
                                            ),
                                            partialNote: stateAction
                                                .partialNoteController
                                                .value
                                                .text,
                                            exchangeNote: stateAction
                                                .exchangeNoteController
                                                .value
                                                .text,
                                          ),
                                child: Text(
                                  "Delivery Done",
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
                                    text: phone,
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
                                        ..merchantRejectOTPVerifyAction(phone),
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
