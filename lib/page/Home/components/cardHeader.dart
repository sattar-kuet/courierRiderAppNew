import 'package:courier_rider/page/Parcel/Provider/ParcelProvider.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

Stack cardHeader(ParcelProvider stateAction, int index) {
  return Stack(
    children: [
      Container(
        width: 100.w,
        height: 12.w,
        decoration: BoxDecoration(
          color: Color(
              int.parse(stateAction.parcelList[index].status!.color!.bgColor)),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(14.sp),
            topRight: Radius.circular(14.sp),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.sp),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              stateAction.parcelList[index].tracking.toString(),
              style: TextStyle(
                fontSize: 15.sp,
                color: Color(
                  int.parse(
                      stateAction.parcelList[index].status!.color!.fontColor),
                ),
              ),
            ),
            Row(
              children: [
                Icon(
                  IconData(
                    int.parse(
                      stateAction.parcelList[index].status!.icon!.code
                          .toString(),
                    ),
                    fontFamily: 'MaterialIcons',
                  ),
                  size: 15.sp,
                  color: Color(
                    int.parse(
                        stateAction.parcelList[index].status!.color!.fontColor),
                  ),
                ),
                SizedBox(
                  width: 3.sp,
                ),
                Text(
                  stateAction.parcelList[index].status!.label.toString(),
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Color(
                      int.parse(stateAction
                          .parcelList[index].status!.color!.fontColor),
                    ),
                  ),
                )
              ],
            )
          ]),
        ),
      )
    ],
  );
}
