import 'package:animated/animated.dart';
import 'package:courier_rider/currentLocation/currentLocation.dart';
import 'package:courier_rider/page/Welcome/Provider/welcomeProvider.dart';
import 'package:courier_rider/utility/extension.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => WelcomeProvider()
            ..loginStatusAction(context)
            ..systemInformationAction(),
        ),
     
      ],
      child: Scaffold(
        body:
            Consumer<WelcomeProvider>(
                builder: (context, stateAction, child) {
              return SafeArea(
                child: Center(
                  child: GFImageOverlay(
                    width: 50.w,
                    height: 50.w,
                    boxFit: BoxFit.contain,
                    colorFilter: const ColorFilter.mode(
                        Colors.transparent, BlendMode.colorBurn),
                    image: const AssetImage('assets/logo/logo.png'),
                  ).displayAnimated(
                    const Duration(milliseconds: 400),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
