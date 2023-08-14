import 'package:courier_rider/page/ParcelDetails/Provider/parcelDetailsProvider.dart';
import 'package:courier_rider/page/ParcelDetails/components/SectionTitle.dart';
import 'package:courier_rider/page/ParcelDetails/components/bodyText.dart';
import 'package:courier_rider/page/ParcelDetails/components/locationDisrections.dart';
import 'package:courier_rider/utility/extension.dart';
import 'package:flutter/material.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:sizer/sizer.dart';

class Address extends StatelessWidget {
  const Address({
    super.key,
    required this.actionValue,
    this.isCustomer = true,
  });
  final ParcelDetailsProvider actionValue;
  final bool isCustomer;
  

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SecationTitle(
          title: isCustomer ? "ডেলিভারি তথ্য" : "পিকআপ তথ্য",
        ).displayAnimated(const Duration(milliseconds: 300)),
        SingleChildScrollView(
          child: SizedBox(
            width: 100.w,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.5.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BodyText(
                        text: isCustomer ? "ডেলিভারি ঠিকানা" : 'পিকআপ ডেলিভারি',
                        textAlign: TextAlign.left,
                      ),
                      Text(
                        isCustomer
                            ? actionValue.parcelDetails.customer!.address
                                .toString()
                            : actionValue.parcelDetails.merchant!.address
                                .toString(),
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(fontSize: 15.sp),
                      ),
                    ],
                  ).displayAnimated(const Duration(milliseconds: 300)),
                  SizedBox(
                    height: 2.5.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          BodyText(
                            text:
                                isCustomer ? "ডেলিভারি এরিয়া" : 'পিকআপ এরিয়া',
                            textAlign: TextAlign.left,
                          ),
                          Text(
                            isCustomer
                                ? actionValue.deliveryAreaCustomer
                                : actionValue.deliveryAreaMerchant,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(fontSize: 15.sp),
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          // Map Launcher
                          // if (false) {
                          // MapsLauncher.launchCoordinates(
                          //   stateAction.parcelList[index].merchant!.lat,
                          //   stateAction.parcelList[index].merchant!.lng,
                          // );
                          // } else {
                          MapsLauncher.launchQuery(isCustomer
                              ? actionValue.parcelDetails.customer!.address
                                  .toString()
                              : actionValue.parcelDetails.merchant!.address
                                  .toString());
                          // }
                        },
                        child: LocationDirectionsDetails(
                          actionValue: actionValue,
                        ),
                      )
                    ],
                  ).displayAnimated(const Duration(milliseconds: 300))
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
