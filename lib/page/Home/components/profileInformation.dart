import 'package:courier_rider/page/Parcel/Provider/ParcelProvider.dart';
import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';

class PracelProfileInformation extends StatelessWidget {
  const PracelProfileInformation({
    super.key,
    required this.stateAction,
    required this.index,
    this.isCustomer = true,
  });
  final ParcelProvider stateAction;
  final int index;
  final bool isCustomer;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 8.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.account_circle,
                color: Color(int.parse(
                    stateAction.parcelList[index].status!.color!.fontColor)),
              ),
              SizedBox(
                width: 5.sp,
              ),
              Text(
                isCustomer
                    ? stateAction.parcelList[index].customer!.name.toString()
                    : stateAction.parcelList[index].merchant!.name.toString(),
                style: TextStyle(
                  color: Color(int.parse(
                      stateAction.parcelList[index].status!.color!.fontColor)),
                  fontSize: 15.sp,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 2.sp,
          ),
          SizedBox(
            width: 100.w,
            child: RichText(
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                text: TextSpan(
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: Color(
                            int.parse(stateAction
                                .parcelList[index].status!.color!.fontColor),
                          ),
                        ),
                    children: [
                      TextSpan(
                        text: isCustomer
                            ? stateAction.parcelList[index].customer!.address
                                .toString()
                            : stateAction.parcelList[index].merchant!.address
                                .toString(),
                      )
                    ])),
          )
        ],
      ),
    );
  }
}
