import 'package:courier_rider/page/Home/ParcelAction/parcelActionDialog/delivery/customerReject.dart';
import 'package:courier_rider/page/Home/ParcelAction/parcelActionDialog/delivery/Delivery.dart';
import 'package:courier_rider/page/Home/ParcelAction/parcelActionDialog/delivery/reSchedule.dart';
import 'package:courier_rider/page/Home/ParcelAction/parcelActionDialog/piackup/parcelReturn.dart';
import 'package:courier_rider/page/Home/ParcelAction/parcelActionDialog/piackup/pickupParcel.dart';
import 'package:courier_rider/page/Home/ParcelAction/parcelActionDialog/piackup/rejectDialog.dart';
import 'package:courier_rider/page/Parcel/Provider/ParcelProvider.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ParcelAction extends StatelessWidget {
  const ParcelAction({
    super.key,
    required this.stateAction,
    required this.index,
  });
  final ParcelProvider stateAction;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 10.sp,
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        if (stateAction.parcelList[index].status!.merchantRejectBtn == true)
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  fullscreenDialog: true,
                  builder: (context) => MerchantRejectDialog(
                    phone: stateAction.parcelList[index].merchant!.phone
                        .toString(),
                    parcelId: stateAction.parcelList[index].id!.toInt(),
                  ),
                ),
              );
            },
            child: Container(
              padding: EdgeInsets.all(4.sp),
              decoration: BoxDecoration(
                  color: Colors.red, borderRadius: BorderRadius.circular(8.sp)),
              alignment: Alignment.center,
              child: Image.asset(
                'assets/actionImage/reject.png',
                width: 30.sp,
                color: Colors.white,
              ),
            ),
          ),
        if (stateAction.parcelList[index].status!.pickupDoneBtn == true)
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  fullscreenDialog: true,
                  builder: (context) => PickupParcelDialog(
                    phone: stateAction.parcelList[index].merchant!.phone
                        .toString(),
                    parcelId: stateAction.parcelList[index].id!.toInt(),
                  ),
                ),
              );
            },
            child: Container(
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
        if (stateAction.parcelList[index].status!.customerRejectBtn == true)
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  fullscreenDialog: true,
                  builder: (context) => CustomerRejectDialog(
                    phone: stateAction.parcelList[index].customer!.phone
                        .toString(),
                    parcelId: stateAction.parcelList[index].id!.toInt(),
                  ),
                ),
              );
            },
            child: Container(
              padding: EdgeInsets.all(4.sp),
              decoration: BoxDecoration(
                  color: Colors.red, borderRadius: BorderRadius.circular(8.sp)),
              alignment: Alignment.center,
              child: Image.asset(
                'assets/actionImage/customerReject.png',
                width: 30.sp,
                color: Colors.white,
              ),
            ),
          ),
        if (stateAction.parcelList[index].status!.rescheduleBtn == true)
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  fullscreenDialog: true,
                  builder: (context) => ReScheduleDialog(
                    phone: stateAction.parcelList[index].customer!.phone
                        .toString(),
                    parcelId: stateAction.parcelList[index].id!.toInt(),
                  ),
                ),
              );
            },
            child: Container(
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
        if (stateAction.parcelList[index].status!.deliveryDoneBtn == true)
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  fullscreenDialog: true,
                  builder: (context) => DeliveryDialog(
                    phone: stateAction.parcelList[index].customer!.phone
                        .toString(),
                    parcelId: stateAction.parcelList[index].id!.toInt(),
                    taka: stateAction.parcelList[index].cashCollection!.toInt(),
                    hasExchange: stateAction.parcelList[index].hasExchange,
                  ),
                ),
              );
            },
            child: Container(
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

        if (stateAction.parcelList[index].status!.returnDoneBtn == true)
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  fullscreenDialog: true,
                  builder: (context) => ParcelReturnDialog(
                    phone: stateAction.parcelList[index].merchant!.phone
                        .toString(),
                    parcelId: stateAction.parcelList[index].id!.toInt(),
                  ),
                ),
              );
            },
            child: Container(
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
      ]),
    );
  }
}
