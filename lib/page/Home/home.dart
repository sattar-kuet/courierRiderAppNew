import 'package:courier_rider/currentLocation/currentLocation.dart';
import 'package:courier_rider/page/Home/Provider/HomeProvider.dart';
import 'package:courier_rider/page/Home/components/cardHeader.dart';
import 'package:courier_rider/page/Home/components/homecomponents.dart';
import 'package:courier_rider/page/Home/components/locationDirections.dart';
import 'package:courier_rider/page/Home/components/merchantPhone.dart';
import 'package:courier_rider/page/Home/components/profileInformation.dart';
import 'package:courier_rider/page/Parcel/Provider/ParcelProvider.dart';
import 'package:courier_rider/utility/extension.dart';
import 'package:flutter/material.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

import 'ParcelAction/parcelAction.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => HomeProvider()
            ..transactionHomeAction()
            ..riderParcelHomeacton(),
        ),
        ChangeNotifierProvider(
          create: (context) => ParcelProvider()..parcelListAction(),
        ),
        ChangeNotifierProvider(
          create: (context) => CurrentLocation()..currentLocationAction(),
        )
      ],
      child:
          Consumer<CurrentLocation>(builder: (context, currentLocation, ___) {
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/qrcode');
            },
            child: const Icon(
              Icons.qr_code,
            ),
          ),
          body: Consumer<HomeProvider>(builder: (context, stateAction, child) {
            return RefreshIndicator(
              onRefresh: () async {
                Provider.of<HomeProvider>(context, listen: false)
                  ..transactionHomeAction()
                  ..riderParcelHomeacton();
                Provider.of<ParcelProvider>(context, listen: false)
                    .parcelListAction();
              },
              child:
                  CustomScrollView(physics: const BouncingScrollPhysics(), slivers: [
                SliverPersistentHeader(
                  delegate: SliverHeader(),
                  pinned: true,
                  floating: false,
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.all(10.sp),
                    child: Text(
                      "Taks List",
                      style: TextStyle(
                          fontSize: 15.sp, fontWeight: FontWeight.bold),
                    ).displayAnimated(const Duration(milliseconds: 500)),
                  ),
                ),
                Consumer<ParcelProvider>(builder: (context, stateAction, __) {
                  return SliverList(
                      delegate: SliverChildBuilderDelegate((context, index) {
                    return Padding(
                      padding: EdgeInsets.all(8.sp),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed('/parceldetails',
                              arguments: stateAction.parcelList[index].id);
                        },
                        child: Container(
                          height: 60.w,
                          width: 100.w,
                          decoration: BoxDecoration(
                              color: Color(int.parse(stateAction
                                      .parcelList[index]
                                      .status!
                                      .color!
                                      .bgColor))
                                  .withOpacity(.8),
                              borderRadius: BorderRadius.circular(14.sp)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Parcel List Header Section
                              cardHeader(stateAction, index),

                              // Parcel Card Body Merchant Phone Section
                              if (stateAction
                                  .parcelList[index].status!.showMerchant) ...[
                                //Profile Information
                                PracelProfileInformation(
                                  stateAction: stateAction,
                                  index: index,
                                  isCustomer: false,
                                ),

                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    // Card List Phone Action
                                    GestureDetector(
                                      onTap: () async {
                                        // Phone launcher
                                        final Uri launchUri = Uri(
                                          scheme: 'tel',
                                          path: stateAction.parcelList[index]
                                              .merchant!.phone,
                                        );
                                        await launchUrl(launchUri);
                                      },
                                      child: ParcelCardListPhone(
                                        stateAction: stateAction,
                                        index: index,
                                      ),
                                    ),

                                    // Card List Address Action
                                    GestureDetector(
                                      onTap: () {
                                        // Map Launcher
                                        if (stateAction.parcelList[index]
                                                .merchant!.lat !=
                                            false) {
                                          MapsLauncher.launchCoordinates(
                                            stateAction.parcelList[index]
                                                .merchant!.lat,
                                            stateAction.parcelList[index]
                                                .merchant!.lng,
                                          );
                                        } else {
                                          MapsLauncher.launchQuery(stateAction
                                              .parcelList[index]
                                              .merchant!
                                              .address
                                              .toString());
                                        }
                                      },
                                      child: LocationDirections(
                                        stateAction: stateAction,
                                        index: index,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                              // Parcel Card Body Customer Address Section
                              if (stateAction
                                  .parcelList[index].status!.showCustomer) ...[
                                // Profile Information
                                PracelProfileInformation(
                                  stateAction: stateAction,
                                  index: index,
                                  isCustomer: true,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    // Card List Phone Action
                                    GestureDetector(
                                      onTap: () async {
                                        // Phone launcher
                                        final Uri launchUri = Uri(
                                          scheme: 'tel',
                                          path: stateAction.parcelList[index]
                                              .merchant!.phone,
                                        );
                                        await launchUrl(launchUri);
                                      },
                                      child: ParcelCardListPhone(
                                        stateAction: stateAction,
                                        index: index,
                                      ),
                                    ),

                                    // Card List Address Action
                                    GestureDetector(
                                      onTap: () {
                                        // Map Launcher
                                        MapsLauncher.launchQuery(stateAction
                                            .parcelList[index].customer!.address
                                            .toString());
                                      },
                                      child: LocationDirections(
                                        stateAction: stateAction,
                                        index: index,
                                      ),
                                    ),
                                  ],
                                )
                              ],

                              // Action Button Section
                              ParcelAction(
                                stateAction: stateAction,
                                index: index,
                              )
                            ],
                          ),
                        ),
                      ).displayAnimated(const Duration(milliseconds: 500)),
                    );
                  }, childCount: stateAction.parcelList.length));
                })
              ]),
            );
          }),
        );
      }),
    );
  }
}
