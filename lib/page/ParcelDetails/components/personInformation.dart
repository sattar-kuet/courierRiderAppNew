import 'package:courier_rider/page/ParcelDetails/Provider/parcelDetailsProvider.dart';
import 'package:courier_rider/page/ParcelDetails/components/SectionTitle.dart';
import 'package:courier_rider/page/ParcelDetails/components/bodyText.dart';
import 'package:courier_rider/utility/extension.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

class PersonInformation extends StatelessWidget {
  const PersonInformation({
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
          title: isCustomer ? 'গ্রাহক তথ্য' : "মার্চেন্ট তথ্য",
        ).displayAnimated(const Duration(milliseconds: 300)),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 2.5.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const BodyText(
                    text: "নাম",
                    textAlign: TextAlign.left,
                  ),
                  BodyText(
                    text: isCustomer
                        ? actionValue.parcelDetails.customer!.name.toString()
                        : actionValue.parcelDetails.merchant!.name.toString(),
                    textAlign: TextAlign.left,
                  ),
                ],
              ).displayAnimated(const Duration(milliseconds: 300)),
              SizedBox(
                height: 2.5.h,
              ),
              Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const BodyText(text: "মোবাইল নম্বর"),
                      GestureDetector(
                        onTap: () async {
                          final Uri url = Uri(
                            scheme: "tel",
                            path: isCustomer
                                ? actionValue.parcelDetails.customer!.phone
                                    .toString()
                                : actionValue.parcelDetails.merchant!.phone
                                    .toString(),
                          );
                          if (await canLaunchUrl(url)) {
                            await launchUrl(url);
                          } else {
                            print(' could not launch $url');
                          }
                        },
                        child: BodyText(
                          text: isCustomer
                              ? actionValue.parcelDetails.customer!.phone
                                  .toString()
                              : actionValue.parcelDetails.merchant!.phone
                                  .toString(),
                          color: Colors.black,
                          fontWeight:true,
                        ),
                      ),
                    ],
                  ).displayAnimated(const Duration(milliseconds: 300)),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
