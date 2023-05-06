import 'package:courier_rider/page/Home/ParcelAction/parcelActionDialog/delivery/Delivery.dart';
import 'package:courier_rider/page/Home/ParcelAction/parcelActionDialog/delivery/customerReject.dart';
import 'package:courier_rider/page/Home/ParcelAction/parcelActionDialog/delivery/reSchedule.dart';
import 'package:courier_rider/page/Home/ParcelAction/parcelActionDialog/piackup/parcelReturn.dart';
import 'package:courier_rider/page/Home/ParcelAction/parcelActionDialog/piackup/pickupParcel.dart';
import 'package:courier_rider/page/Home/ParcelAction/parcelActionDialog/piackup/rejectDialog.dart';
import 'package:courier_rider/page/ParcelDetails/components/address.dart';
import 'package:courier_rider/page/ParcelDetails/components/bodyText.dart';
import 'package:courier_rider/page/ParcelDetails/components/SectionTitle.dart';
import 'package:courier_rider/page/ParcelDetails/components/personInformation.dart';
import 'package:courier_rider/utility/extension.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import 'Provider/parcelDetailsProvider.dart';

class ParcelDetailsView extends StatelessWidget {
  const ParcelDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    final int route = ModalRoute.of(context)!.settings.arguments as int;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) =>
              ParcelDetailsProvider()..parcelDetailsAction(route),
        )
      ],
      child:
          Consumer<ParcelDetailsProvider>(builder: (context, actionValue, __) {
        return Scaffold(
          bottomNavigationBar: BottomAppBar(
              child: actionValue.isLoading
                  ? Container()
                  : Container(
                      height: 20.w,
                      width: 100.w,
                      color: Color(int.parse(actionValue
                          .parcelDetails.parcel!.status!.icon!.bgColor
                          .toString())),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          if (actionValue.parcelDetails.parcel!.status!
                                  .merchantRejectBtn ==
                              true)
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    fullscreenDialog: true,
                                    builder: (context) => MerchantRejectDialog(
                                      phone: actionValue
                                          .parcelDetails.merchant!.phone
                                          .toString(),
                                      parcelId: actionValue
                                          .parcelDetails.parcel!.id!
                                          .toInt(),
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                width: 20.w,
                                height: 15.w,
                                padding: EdgeInsets.all(4.sp),
                                decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(8.sp)),
                                alignment: Alignment.center,
                                child: Image.asset(
                                  'assets/actionImage/reject.png',
                                  width: 30.sp,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          if (actionValue.parcelDetails.parcel!.status!
                                  .pickupDoneBtn ==
                              true)
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    fullscreenDialog: true,
                                    builder: (context) => PickupParcelDialog(
                                      phone: actionValue
                                          .parcelDetails.merchant!.phone
                                          .toString(),
                                      parcelId: actionValue
                                          .parcelDetails.parcel!.id!
                                          .toInt(),
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                width: 20.w,
                                height: 15.w,
                                padding: EdgeInsets.all(4.sp),
                                decoration: BoxDecoration(
                                    color: const Color.fromARGB(255, 0, 127, 4),
                                    borderRadius: BorderRadius.circular(8.sp)),
                                alignment: Alignment.center,
                                child: Image.asset(
                                  'assets/actionImage/pickupDone.png',
                                  width: 30.sp,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          //  Delivery time Button Action
                          if (actionValue.parcelDetails.parcel!.status!
                                  .customerRejectBtn ==
                              true)
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    fullscreenDialog: true,
                                    builder: (context) => CustomerRejectDialog(
                                      phone: actionValue
                                          .parcelDetails.customer!.phone
                                          .toString(),
                                      parcelId: actionValue
                                          .parcelDetails.parcel!.id!
                                          .toInt(),
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                width: 20.w,
                                height: 15.w,
                                padding: EdgeInsets.all(4.sp),
                                decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(8.sp)),
                                alignment: Alignment.center,
                                child: Image.asset(
                                  'assets/actionImage/customerReject.png',
                                  width: 30.sp,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          if (actionValue.parcelDetails.parcel!.status!
                                  .rescheduleBtn ==
                              true)
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    fullscreenDialog: true,
                                    builder: (context) => ReScheduleDialog(
                                      phone: actionValue
                                          .parcelDetails.customer!.phone
                                          .toString(),
                                      parcelId: actionValue
                                          .parcelDetails.parcel!.id!
                                          .toInt(),
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                width: 20.w,
                                height: 15.w,
                                padding: EdgeInsets.all(4.sp),
                                decoration: BoxDecoration(
                                    color: Colors.orangeAccent,
                                    borderRadius: BorderRadius.circular(8.sp)),
                                alignment: Alignment.center,
                                child: Image.asset(
                                  'assets/actionImage/calendar.png',
                                  width: 30.sp,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          if (actionValue.parcelDetails.parcel!.status!
                                  .deliveryDoneBtn ==
                              true)
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    fullscreenDialog: true,
                                    builder: (context) => DeliveryDialog(
                                      phone: actionValue
                                          .parcelDetails.customer!.phone
                                          .toString(),
                                      parcelId: actionValue
                                          .parcelDetails.parcel!.id!
                                          .toInt(),
                                      taka: actionValue
                                          .parcelDetails.parcel!.cashCollection!
                                          .toInt(),
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                width: 20.w,
                                height: 15.w,
                                padding: EdgeInsets.all(4.sp),
                                decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(8.sp)),
                                alignment: Alignment.center,
                                child: Image.asset(
                                  'assets/actionImage/delivery-man.png',
                                  width: 30.sp,
                                  color: Colors.white,
                                ),
                              ),
                            ),

                          if (actionValue.parcelDetails.parcel!.status!
                                  .returnDoneBtn ==
                              true)
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    fullscreenDialog: true,
                                    builder: (context) => ParcelReturnDialog(
                                      phone: actionValue
                                          .parcelDetails.merchant!.phone
                                          .toString(),
                                      parcelId: actionValue
                                          .parcelDetails.parcel!.id!
                                          .toInt(),
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                width: 20.w,
                                height: 15.w,
                                padding: EdgeInsets.all(4.sp),
                                decoration: BoxDecoration(
                                    color: Colors.orangeAccent,
                                    borderRadius: BorderRadius.circular(8.sp)),
                                alignment: Alignment.center,
                                child: Image.asset(
                                  'assets/actionImage/return.png',
                                  width: 30.sp,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                        ],
                      ),
                    )),
          appBar: !actionValue.isLoading
              ? AppBar(
                  backgroundColor: Color(int.parse(actionValue
                      .parcelDetails.parcel!.status!.icon!.bgColor
                      .toString())),
                  title: Text(
                      actionValue.parcelDetails.parcel!.tracking.toString()))
              : null,
          body: actionValue.isLoading
              ? null
              : SafeArea(
                  child: SingleChildScrollView(
                    child: Column(children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 2.5.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const BodyText(text: "পার্সেল স্ট্যাটাস")
                                .displayAnimated(
                                    const Duration(milliseconds: 300)),
                            Row(
                              children: [
                                Icon(IconData(
                                    int.parse(
                                      actionValue.parcelDetails.parcel!.status!
                                          .icon!.code
                                          .toString(),
                                    ),
                                    fontFamily: 'MaterialIcons')),
                                SizedBox(
                                  width: 5.sp,
                                ),
                                BodyText(
                                    text: actionValue
                                        .parcelDetails.parcel!.status!.label
                                        .toString())
                              ],
                            ).displayAnimated(const Duration(milliseconds: 300))
                          ],
                        ),
                      ),
                      const SecationTitle(
                        title: "পেমেন্ট বিবরণ",
                      ).displayAnimated(const Duration(milliseconds: 300)),

                      // Payement Details Secation Start
                      for (var i = 0;
                          i < actionValue.parcelCashLength;
                          i++) ...[
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 2.5.w, vertical: 4.sp),
                          child: (actionValue.parcelCashLength - 1) == i
                              ? Column(
                                  children: [
                                    Divider(
                                      height: 5.sp,
                                      color: Colors.grey,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: 4.sp),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          BodyText(
                                              text: actionValue
                                                  .parcelDetails.cash![i].label
                                                  .toString()),
                                          BodyText(
                                              text:
                                                  "৳${actionValue.parcelDetails.cash![i].value}"),
                                        ],
                                      ),
                                    )
                                  ],
                                ).displayAnimated(
                                  const Duration(milliseconds: 300))
                              : Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    BodyText(
                                        text: actionValue
                                            .parcelDetails.cash![i].label
                                            .toString()),
                                    BodyText(
                                        text: "৳ ${PersonInformation(
                                      actionValue: actionValue,
                                    )}"),
                                  ],
                                ).displayAnimated(
                                  const Duration(milliseconds: 300)),
                        )
                      ],
                      // Custom Information Section Start
                      if (actionValue.parcelDetails.parcel!.status!
                              .show_customer as bool ==
                          true)
                        PersonInformation(
                          actionValue: actionValue,
                        ),

                      //  Merchant Information Section Start
                      if (actionValue.parcelDetails.parcel!.status!
                              .show_merchant as bool ==
                          true)
                        PersonInformation(
                          actionValue: actionValue,
                          isCustomer: false,
                        ),

                      // Address Information Section Start
                      if (actionValue.parcelDetails.parcel!.status!
                              .show_customer as bool ==
                          true)
                        Address(
                          actionValue: actionValue,
                        ),
                      if (actionValue.parcelDetails.parcel!.status!
                              .show_merchant as bool ==
                          true)
                        Address(
                          actionValue: actionValue,
                          isCustomer: false,
                        ),

                      const SecationTitle(
                        title: "পার্সেল তথ্য",
                      ).displayAnimated(const Duration(milliseconds: 300)),
                      SizedBox(
                        width: 100.w,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 2.5.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const BodyText(
                                        text: "পার্সেল প্রকার",
                                        textAlign: TextAlign.left,
                                      ),
                                      Text(
                                        actionValue.parcelDetails.parcel!.type
                                            .toString(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1!
                                            .copyWith(fontSize: 15.sp),
                                      ),
                                    ],
                                  ).displayAnimated(
                                      const Duration(milliseconds: 300)),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const BodyText(
                                        text: "ওজন",
                                        textAlign: TextAlign.left,
                                      ),
                                      Text(
                                        actionValue.parcelDetails.parcel!.weight
                                            .toString(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1!
                                            .copyWith(fontSize: 15.sp),
                                      ),
                                    ],
                                  ).displayAnimated(
                                      const Duration(milliseconds: 300)),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const BodyText(
                                        text: "রেফারেন্স",
                                        textAlign: TextAlign.left,
                                      ),
                                      Text(
                                        actionValue.parcelDetails.parcel!
                                            .merchantReference
                                            .toString(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1!
                                            .copyWith(fontSize: 15.sp),
                                      ),
                                    ],
                                  ).displayAnimated(
                                      const Duration(milliseconds: 300)),
                                ],
                              ),
                              SizedBox(
                                height: 2.5.h,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const BodyText(
                                    text: "পার্সেল তৈরি",
                                    textAlign: TextAlign.left,
                                  ),
                                  Text(
                                    actionValue.parcelDetails.parcel!.createdAt
                                        .toString(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1!
                                        .copyWith(fontSize: 15.sp),
                                  ),
                                ],
                              ).displayAnimated(
                                  const Duration(milliseconds: 300)),
                              SizedBox(
                                height: 2.5.h,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const BodyText(
                                    text: "বিনিময় আছে",
                                    textAlign: TextAlign.left,
                                  ),
                                  Text(
                                    actionValue.parcelDetails.parcel!
                                                .hasExchange ==
                                            true
                                        ? "Yes"
                                        : "No",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1!
                                        .copyWith(fontSize: 15.sp),
                                  ),
                                ],
                              ).displayAnimated(
                                  const Duration(milliseconds: 300)),
                              SizedBox(
                                height: 2.5.h,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const BodyText(
                                    text: "ডেলিভারি নির্দেশাবলী",
                                    textAlign: TextAlign.left,
                                  ),
                                  Text(
                                    actionValue.parcelDetails.parcel!.note
                                        .toString(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1!
                                        .copyWith(fontSize: 15.sp),
                                  ),
                                ],
                              ).displayAnimated(
                                  const Duration(milliseconds: 300))
                            ],
                          ),
                        ),
                      ),
                    ]),
                  ),
                ),
        ).loading(context, actionValue.isLoading);
      }),
    );
  }
}
