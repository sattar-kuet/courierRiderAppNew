import 'package:courier_rider/page/Parcel/Provider/ParcelProvider.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ParcelCardListPhone extends StatelessWidget {
  const ParcelCardListPhone({
    super.key,
    required this.stateAction,
    required this.index,
    this.iscustomer = false,
  });
  final ParcelProvider stateAction;
  final int index;
  final bool iscustomer;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 8.sp),
      child: Row(
        children: [
          Icon(
            Icons.phone,
            size: 15.sp,
            color: Color(
              int.parse(stateAction.parcelList[index].status!.color!.fontColor),
            ),
          ),
          SizedBox(
            width: 5.sp,
          ),
          Text(
            iscustomer
                ? stateAction.parcelList[index].customer!.phone.toString()
                : stateAction.parcelList[index].merchant!.phone.toString(),
            style: TextStyle(
              fontSize: 15.sp,
              color: Color(
                int.parse(
                    stateAction.parcelList[index].status!.color!.fontColor),
              ),
            ),
          )
        ],
      ),
    );
  }
}
