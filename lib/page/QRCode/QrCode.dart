import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:sizer/sizer.dart';

import 'Provider/QRcodeProvider.dart';

class QRCodeView extends StatefulWidget {
  const QRCodeView({super.key});

  @override
  State<QRCodeView> createState() => _QRCodeViewState();
}

class _QRCodeViewState extends State<QRCodeView> {
  final qrKey = GlobalKey(debugLabel: "QR");
  QRViewController? controller;
  Barcode? barcodeData;

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  void reassemble() async {
    super.reassemble();

    if (Platform.isAndroid) {
      await controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("QRCode Scanner"),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          buildQrView(context),
          Positioned(top: 10.sp, child: buildControlButtons(context))
        ],
      ),
    );
  }

  Widget buildControlButtons(BuildContext context) => Container(
        width: 10.w,
        height: 10.w,
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(5.sp)),
        child: FutureBuilder(
            future: controller?.getFlashStatus(),
            builder: (context, snapshot) {
              if (snapshot.data != null) {
                return IconButton(
                  icon: Icon(
                    snapshot.data! ? Icons.flash_on : Icons.flash_off,
                    color: Colors.white,
                  ),
                  onPressed: () async {
                    await controller!.toggleFlash();
                    setState(() {});
                  },
                );
              } else {
                return Container();
              }
            }),
      );

  Widget buildQrView(BuildContext context) => QRView(
        key: qrKey,
        onQRViewCreated: onQRViewCreated,
        overlay: QrScannerOverlayShape(
            cutOutSize: 80.w,
            borderWidth: 10.sp,
            borderLength: 20.sp,
            borderRadius: 10.sp,
            borderColor: Colors.red),
      );

  void onQRViewCreated(QRViewController controller) {
    setState(() => this.controller = controller);
    controller.scannedDataStream.listen((barcode) {
      Provider.of<QrCodeProvider>(context, listen: false)
          .checkParcelStatusAction(context, barcode.code.toString());
    });
  }
}
