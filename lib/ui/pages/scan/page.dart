// ignore_for_file: avoid_print
import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:tickety_admission/services/user_session.dart';
import 'package:tickety_admission/tools/helpers.dart';
import 'package:tickety_admission/ui/pages/status/controller.dart';
import 'package:tickety_admission/ui/widgets/appbar.dart';
import 'package:tickety_admission/ui/widgets/avatar.dart';
import 'package:tickety_admission/ui/widgets/settings_icon.dart';
import 'package:tickety_admission/values/colors.dart';

class Scan extends StatefulWidget {
  const Scan({super.key});

  @override
  State<StatefulWidget> createState() => _ScanState();
}

class _ScanState extends State<Scan> {
  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller?.pauseCamera();
    } else {
      controller?.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    UserSessionService session = Get.find<UserSessionService>();
    return Scaffold(
      appBar: CustomAppBar(
        leading: Avatar(
          firstName: session.firstName,
          lastName: session.lastName,
        ),
        titleWidget: const Center(
          child: Text(
            "Ticket QR Code",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 20,
              color: neutralColor100,
            ),
          ),
        ),
        trailing: SettingsIcon(
          icon: "changeIcon",
          onTap: () => Get.offAllNamed("/events"),
        ),
      ),
      body: Stack(
        children: [
          _buildQrView(context),
          const Positioned(
            top: 150,
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                'Scan QR Code',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal,
                  color: neutralColor100,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    var scanArea = (MediaQuery.of(context).size.width) * 0.8;
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
        borderColor: kPrimaryColor,
        overlayColor: neutralColor900,
        borderRadius: 10,
        borderLength: 30,
        borderWidth: 10,
        cutOutSize: scanArea,
      ),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  final StatusPageController statusController =
      Get.find<StatusPageController>();

  final UserSessionService session = Get.find<UserSessionService>();

  String updateUrlParams(String url,
      {String? event, String? tkt, String? signature}) {
    List<String> params = url.split('&');
    Map<String, String> paramMap = {};

    // Populate the map with existing key-value pairs
    for (String param in params) {
      List<String> keyValue = param.split('=');
      if (keyValue.length == 2) {
        paramMap[keyValue[0]] = keyValue[1];
      }
    }

    // Update the values if new values are provided
    if (event != null) {
      paramMap['?event'] = event;
    }
    if (tkt != null) {
      paramMap['tkt'] = tkt;
    }
    if (signature != null) {
      paramMap['signature'] = signature;
    }

    // Construct the updated URL
    List<String> updatedParams = [];
    paramMap.forEach((key, value) {
      updatedParams.add('$key=$value');
    });

    return updatedParams.join('&');
  }

  void _onQRViewCreated(QRViewController controller) {
    //
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
        if (result != null) {
          statusController.urlQuery.value = result!.code!;
          statusController.urlQuery.value = updateUrlParams(result!.code!,
              event: "${session.event["eventID"]}");

          print("UPDATED URL ${statusController.urlQuery.value}");
          Get.toNamed('/status');
        } else {
          showSnackBar(
            title: 'Invalid QR Code',
            message: 'Try Scanning again!',
          );
          return;
        }
      });
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No Permission')),
      );
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
