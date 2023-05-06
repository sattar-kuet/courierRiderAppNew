import 'package:courier_rider/page/Parcel/Provider/ParcelProvider.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class LocationDirections extends StatelessWidget {
  const LocationDirections({
    super.key,
    required this.stateAction,
    required this.index,
  });
  final ParcelProvider stateAction;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 8.sp),
      child: Row(
        children: [
          Icon(
            Icons.directions,
            size: 15.sp,
            color: Color(
              int.parse(stateAction.parcelList[index].status!.color!.fontColor),
            ),
          ),
          SizedBox(
            width: 5.sp,
          ),
          Text(
            "Directions",
            style: TextStyle(
                fontSize: 15.sp,
                color: Color(
                  int.parse(
                      stateAction.parcelList[index].status!.color!.fontColor),
                ),
                fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
