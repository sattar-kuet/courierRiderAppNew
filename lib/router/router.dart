import 'package:courier_rider/page/Home/home.dart';
import 'package:courier_rider/page/Login/login.dart';
import 'package:courier_rider/page/ParcelDetails/parcelDetails.dart';
import 'package:courier_rider/page/PhoneVerify/PhoneVerify.dart';
import 'package:courier_rider/page/QRCode/QrCode.dart';

import 'package:courier_rider/page/Welcome/welcome.dart';
import 'package:flutter/material.dart';

class Routers {
  static Map<String, Widget Function(BuildContext)> getRoute = {
    '/': (_) => const HomeView(),
    '/welcome': (_) => const WelcomeView(),
    '/login': (_) => const LoginView(),
    '/otp': (_) => const LoginWithOtpView(),
    '/qrcode': (_) => const QRCodeView(),
    '/parceldetails': (_) => const ParcelDetailsView()
  };
}
