import 'package:courier_rider/page/Home/ParcelAction/parcelActionDialog/Provider/parcelActionDialogProvider.dart';
import 'package:courier_rider/utility/extension.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class ParcelReturnDialog extends StatelessWidget {
  const ParcelReturnDialog({
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
              title: const Text("Parcel Return"),
              backgroundColor: Colors.orangeAccent,
            ),
            body: SafeArea(
              child: SizedBox(
                width: 100.w,
                height: 100.h,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 50.w,
                          height: 12.w,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.orangeAccent,
                            ),
                            onPressed: () =>
                                Provider.of<ParcelActionDialogProvider>(context,
                                    listen: false)
                                  ..parcelreturnAction(
                                    context,
                                    parcelID: parcelId,
                                  ),
                            child: Text(
                              "Return Done",
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
                      ]),
                ),
              ),
            )).loading(context, stateAction.isLoading);
      }),
    );
  }
}
