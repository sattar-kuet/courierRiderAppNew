import 'package:courier_rider/page/Home/ParcelAction/parcelActionDialog/Provider/parcelActionDialogProvider.dart';
import 'package:courier_rider/utility/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class ReScheduleDialog extends StatelessWidget {
  const ReScheduleDialog({
    super.key,
    required this.phone,
    required this.parcelId,
  });
  final String phone;
  final int parcelId;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ParcelActionDialogProvider(),
      child: Consumer<ParcelActionDialogProvider>(
          builder: (context, stateAction, __) {
        return Scaffold(
            appBar: AppBar(
              title: const Text("Parcel Reschedule"),
              backgroundColor: Colors.orangeAccent,
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
                              width: 40.w,
                              height: 12.w,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Theme.of(context).primaryColor,
                                ),
                                onPressed: () async {
                                  DatePicker.showDateTimePicker(context,
                                      showTitleActions: true,
                                      minTime: DateTime(2018, 3, 5),
                                      maxTime: DateTime(2050, 1, 1),
                                      onConfirm: (date) {
                                    Provider.of<ParcelActionDialogProvider>(
                                        context,
                                        listen: false)
                                      ..initDateTimeaction(date.toString())
                                      ..dateTimeOnChangeAction();
                                  },
                                      currentTime: DateTime.now(),
                                      locale: LocaleType.bn);
                                },
                                child: Text(
                                  "Select Date",
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
                            SizedBox(
                              height: 25.sp,
                            ),
                            TextField(
                              minLines: 6,
                              maxLines: 15,
                              controller: stateAction.noteController,
                              keyboardType: TextInputType.multiline,
                              onChanged: (value) =>
                                  Provider.of<ParcelActionDialogProvider>(
                                context,
                                listen: false,
                              )
                                    ..noteOnChangeAction()
                                    ..dateTimeOnChangeAction(),
                              decoration: const InputDecoration(
                                alignLabelWithHint: true,
                                border: OutlineInputBorder(),
                                labelText: 'write a Reject Notes',
                              ),
                            ),
                            SizedBox(
                              height: 30.sp,
                            ),
                            SizedBox(
                              width: 40.w,
                              height: 12.w,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.orangeAccent,
                                ),
                                onPressed: stateAction.btnEnable == false
                                    ? null
                                    : () =>
                                        Provider.of<ParcelActionDialogProvider>(
                                            context,
                                            listen: false)
                                          ..reScheduleParcelAction(
                                            context,
                                            note: stateAction
                                                .noteController.value.text,
                                            parcelID: parcelId,
                                            datetime: stateAction.dateTime,
                                          ),
                                child: Text(
                                  "Reschedule",
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
                                    primary: Colors.red,
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
