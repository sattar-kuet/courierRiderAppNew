import 'package:courier_rider/page/ParcelDetails/Provider/parcelDetailsProvider.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class LocationDirectionsDetails extends StatelessWidget {
  const LocationDirectionsDetails({
    super.key,
    required this.actionValue,
  });
  final ParcelDetailsProvider actionValue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 8.sp),
      child: Row(
        children: [
          Icon(
            Icons.directions,
            size: 15.sp,
          ),
          SizedBox(
            width: 5.sp,
          ),
          Text(
            "Directions",
            style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
