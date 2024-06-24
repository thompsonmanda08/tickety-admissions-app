// ignore_for_file: avoid_print, unnecessary_null_comparison

import 'dart:developer';
import 'package:flutter/services.dart';
import 'package:tickety_admission/models/api_response.dart';
import 'package:tickety_admission/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

APIServiceResponse<R> unpackAPIResponse<R>(Response r) {
  APIServiceResponse<R> res = APIServiceResponse();
  if (!r.isOk || r.body == null) {
    res.message =
        "Sorry, something went wrong: ${r.statusCode} ${r.statusText}";
    return res;
  }
  Map<String, dynamic>? data = r.body;

  res.statusText = data?["status"];
  res.statusCode = data?["statusCode"];
  res.message = data?["message"];
  res.data = data != null && data["data"] != null ? data["data"] as R : null;

  return res;
}

createLog(String message) {
  log("[TICKETY] $message");
  print("[TICKETY] $message");
}

showDefaultLoader([String? title = "Please wait..."]) {
  Get.defaultDialog(
    barrierDismissible: false,
    title: title!,
    titleStyle: TextStyle(
      color: Colors.black.withOpacity(0.9),
    ),
    content: const SpinKitRipple(
      color: Colors.blueAccent,
      size: 40,
    ),
  );
}

Future showAlertBox({
  required String type,
  required String title,
  required String message,
}) {
  var color = kRedColor;
  var icon = const Icon(
    Icons.error_outlined,
    color: kRedColor,
  );

  if (type == "info") {
    color = Colors.blueAccent;
    icon = Icon(
      Icons.info_outlined,
      color: color,
    );
  } else if (type == "warn") {
    color = Colors.orange;
    icon = Icon(
      Icons.warning_outlined,
      color: color,
    );
  } else if (type == "success") {
    color = kGreenColor;
    icon = Icon(
      Icons.check_outlined,
      color: color,
    );
  }

  return Get.defaultDialog(
    barrierDismissible: true,
    title: "",
    backgroundColor: Colors.white,
    content: Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      width: 300,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              icon,
              const SizedBox(
                width: 2,
              ),
              Text(
                title,
                style: TextStyle(
                  color: color,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            message,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    ),
    confirm: TextButton(
      onPressed: () {
        Get.back();
      },
      child: const Text(
        "Ok",
        style: TextStyle(
          color: kPrimaryColor,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}

showSnackBar(
    {required String title,
    required String message,
    Color backgroundColor = kPrimaryColor}) {
  Get.snackbar(
    title,
    message,
    snackPosition: SnackPosition.BOTTOM,
    margin: const EdgeInsets.all(0),
    borderRadius: 0,
    backgroundColor: backgroundColor,
    //overlayBlur: 2,
    colorText: Colors.white,
    forwardAnimationCurve: Curves.bounceInOut,
  );
}

bool isDouble(dynamic s) {
  if (s == null) {
    return false;
  }
  return double.tryParse(s) != null;
}

bool isInteger(String? s) {
  if (s == null) {
    return false;
  }
  return double.tryParse(s) != null;
}

String formatCurrency(double? amount) {
  final currencyFormat = NumberFormat.currency(locale: 'en_US', symbol: 'K');
  return currencyFormat.format(amount);
}

bool isValidMobileNumber(String phoneNumber) {
  // Remove all non-digit characters from the input string
  String phoneNumberDigits = phoneNumber.trim().replaceAll(RegExp(r'\D'), '');

  // Phone Number must have 10 digits OR
  if (phoneNumberDigits.isEmpty) {
    showSnackBar(
      backgroundColor: kRedColor,
      title: 'Invalid Mobile Number',
      message: 'You did not provide a valid mobile number.',
    );
    return false;
  }
  return true;
}

String parsePhoneNumber(String number) {
  String phoneNumberDigits;

  if (isValidMobileNumber(number)) {
    if (!number.startsWith('+')) {
      return number;
    }
    phoneNumberDigits = number.substring(1);
    return phoneNumberDigits;
  }
  return "Invalid Number!";
}

String maskTransactionDetail(string,
    {int? firstCharacters = 9, int? lastCharacters = 4}) {
  if (string.length < 12) {
    return string;
  }

  String first = string.toString().substring(0, firstCharacters);
  String last = string.toString().substring(string.length - lastCharacters);

  return "$first **$last";
}

class NoGlowScrollBehavior extends ScrollBehavior {
  // Remove glows on scroll
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}

String formatDateTime(String dateStr) {
  try {
    final DateTime dateTime = DateTime.parse(dateStr);
    final formatter = DateFormat("dd MMM yyyy");
    return formatter.format(dateTime);
  } catch (e) {
    return '- - -';
  }
}

void setStatusBarColor(
  Color color, {
  bool scrollable = false,
  double scrollOffsetY = 0.01,
  double maxScrollOffset = 25.00,
}) {
  if (scrollable) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: color.withOpacity(
          (scrollOffsetY / maxScrollOffset).clamp(0, 1).toDouble(),
        ),
      ),
    );
  } else {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: color,
      ),
    );
  }
}

class PasswordValidator {
  static bool isPasswordValid(String password) {
    String pattern = r'^(?=.*?[A-Z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = RegExp(pattern);

    bool isValid = regExp.hasMatch(password);

    if (!isValid) {
      showAlertBox(
          type: 'error',
          title: 'Invalid Password Format',
          message:
              'Password must include symbols, numbers, capital letters, and at least 8 characters long');
    }

    return isValid;
  }
}

bool isNumeric(String input) {
  // Use a regular expression to check if the input is numeric
  return int.tryParse(input) != null;
}
