import 'package:courier_rider/page/Home/ParcelAction/parcelActionDialog/Provider/parcelActionDialogProvider.dart';
import 'package:courier_rider/utility/extension.dart';
import 'package:date_time_picker_widget/date_time_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: stateAction.isVerify
                          ? [
                              _dateTimePicker(context),
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
                                  labelText: 'write reason.',
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
                                      : () => Provider.of<
                                              ParcelActionDialogProvider>(
                                          context,
                                          listen: false)
                                        ..reScheduleParcelAction(
                                          context,
                                          note: stateAction
                                              .noteController.value.text,
                                          parcelID: parcelId,
                                          datetime:
                                              '${stateAction.date} ${stateAction.time}',
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
                                    onPressed: () => Provider.of<
                                            ParcelActionDialogProvider>(context,
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
                                  (value) => Provider.of<
                                          ParcelActionDialogProvider>(context,
                                      listen: false)
                                    ..merchantOTPVerifyAction(context, value),
                                ),
                              ]
                            ],
                    ),
                  ),
                ),
              ),
            )).loading(
          context,
          stateAction.isLoading,
        );
      }),
    );
  }

  Widget _dateTimePicker(BuildContext context) {
    final dt = DateTime.now();
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Reschedule Time',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 8),
        const SizedBox(height: 16),
        DateTimePicker(
          initialSelectedDate: dt,
          startTime: DateTime(dt.year, dt.month, dt.day, 6),
          timeInterval: const Duration(minutes: 15),
          datePickerTitle: 'Select date',
          timePickerTitle: 'Select time',
          is24h: false,
          numberOfWeeksToDisplay: 2,
          onDateChanged: (date) {
            String formattedDate = DateFormat('yyyy-MM-dd').format(date);
            Provider.of<ParcelActionDialogProvider>(context, listen: false)
              ..updateDate(formattedDate)
              ..dateTimeOnChangeAction();
          },
          onTimeChanged: (time) {
            String formattedTime = DateFormat('HH:mm:ss').format(time);
            Provider.of<ParcelActionDialogProvider>(context, listen: false)
              ..updateTime(formattedTime)
              ..dateTimeOnChangeAction();
          },
        )
      ],
    );
  }
}
