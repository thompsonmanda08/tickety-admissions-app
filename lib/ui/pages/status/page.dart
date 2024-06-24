import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tickety_admission/ui/pages/status/controller.dart';
import 'package:tickety_admission/ui/pages/status/widgets/error.dart';
import 'package:tickety_admission/ui/pages/status/widgets/loading.dart';
import 'package:tickety_admission/ui/pages/status/widgets/ticket.dart';

// ignore: must_be_immutable
class StatusPage extends GetView<StatusPageController> {
  const StatusPage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: controller.manualValidation.value
          ? controller.validateTicketNumber()
          : controller.validateTicketSignature(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // * LOADING INDICATOR - WHILE FETCHING TICKET DETAILS.
          return const ValidatingScreen();
        } else if (snapshot.hasError) {
          // * ERROR FETCHING DATA PROMPT USER TO RELOAD!
          return const ErrorScreen();
        } else {
          // * DISPLAY TICKET DETAILS!
          return const TicketDetailsScreen();
        }
      },
    );
  }
}
