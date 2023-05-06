import 'dart:io';

import 'package:courier_rider/page/Home/Provider/HomeProvider.dart';
import 'package:courier_rider/page/Parcel/Provider/ParcelProvider.dart';
import 'package:courier_rider/page/PhoneVerify/Provider/PhoneVerifyProvider.dart';
import 'package:courier_rider/page/Login/Provider/LoginProvider.dart';
import 'package:courier_rider/page/QRCode/Provider/QRcodeProvider.dart';
import 'package:courier_rider/page/Welcome/Provider/welcomeProvider.dart';
import 'package:courier_rider/router/router.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

late SharedPreferences sharedPreferences;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPreferences = await SharedPreferences.getInstance();
  runApp(const ITscholarMain());
}

class ITscholarMain extends StatelessWidget {
  const ITscholarMain({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, _, __) {
      return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => WelcomeProvider()..systemInformationAction(),
          ),
          ChangeNotifierProvider(
            create: (context) => PhoneVerifyProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => LoginProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => ParcelProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => HomeProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => QrCodeProvider(),
          ),
        ],
        child: MaterialApp(
          title: "ITscholar Rider",
          theme: FlexThemeData.light(scheme: FlexScheme.green),
          darkTheme: FlexThemeData.dark(scheme: FlexScheme.blue),
          themeMode: ThemeMode.light,
          routes: Routers.getRoute,
          initialRoute: '/welcome',
        ),
      );
    });
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
