import 'package:courier_rider/page/Home/Provider/HomeProvider.dart';
import 'package:courier_rider/utility/config.dart';
import 'package:courier_rider/utility/extension.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class SliverHeader extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    bool isshow = shrinkOffset > 35.h;
    double parsent = shrinkOffset / 45.h;

    return Stack(
      fit: StackFit.expand,
      children: [
        Container(
          width: 100.w,
          height: 100.h,
          color: isshow ? Colors.transparent : Colors.white,
        ),
        Positioned(
          bottom: 4.h,
          right: 0,
          left: 0,
          child: Transform.scale(
            scale: 1 - parsent,
            child: AnimatedOpacity(
              opacity: 1 - parsent,
              duration: const Duration(milliseconds: 200),
              child: Consumer<HomeProvider>(
                  builder: (context, stateAction, child) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: stateAction.riderParcel
                          .map((e) => InfoCard(
                                id: e.id.toString(),
                                image: e.icon.toString(),
                                color: e.color!.bgColor.toString(),
                                level: e.title.toString(),
                                value: e.value.toString(),
                              ))
                          .toList(),
                    ).displayAnimated(const Duration(milliseconds: 500)),
                    SizedBox(
                      height: 2.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: stateAction.transactions
                          .map((e) => InfoCard(
                                id: e.id.toString(),
                                image: e.icon.toString(),
                                color: e.color!.bgColor.toString(),
                                level: e.title.toString(),
                                value: e.value.toString(),
                              ))
                          .toList(),
                    ).displayAnimated(const Duration(milliseconds: 500)),
                  ],
                );
              }),
            ),
          ),
        ),
        Positioned(
            top: 0,
            child: AnimatedContainer(
                width: 100.w,
                color: isshow
                    ? Theme.of(context).colorScheme.primary
                    : Colors.white,
                padding: EdgeInsets.only(
                    top: 5.h, right: 3.w, left: 3.w, bottom: 2.w),
                duration: const Duration(milliseconds: 00),
                child: HomeAppBar(isshow: isshow))),

        // App Bar Section End
      ],
    );
  }

  @override
  double get maxExtent => double.parse("${45.h}");

  @override
  double get minExtent => double.parse("${11.h}");

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      false;
}

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
    required this.isshow,
  });

  final bool isshow;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            isshow ? "Task List" : name,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontSize: 20.sp,
                color: isshow ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.notifications,
                    size: 20.sp,
                    color: isshow ? Colors.white : Colors.black,
                  )),
              SizedBox(
                width: 6.sp,
              ),
              GFAvatar(
                radius: 15.sp,
              )
            ],
          ),
        ],
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  final String id;
  final String image;
  final String color;
  final String value;
  final String level;
  const InfoCard(
      {super.key,
      required this.image,
      required this.color,
      required this.value,
      required this.level,
      required this.id});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 27.w,
      width: 30.w,
      child: Card(
        shadowColor: Theme.of(context).primaryColor,
        color: Color(int.parse(color)),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14.sp),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.memory(
              image.memoryImage,
              width: 10.w,
            ),
            Text(
              value,
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(fontSize: 15.sp, color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
