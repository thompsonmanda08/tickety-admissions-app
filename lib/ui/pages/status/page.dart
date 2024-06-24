import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tickety_admission/ui/pages/status/controller.dart';
import 'package:tickety_admission/ui/pages/status/widgets/error.dart';
import 'package:tickety_admission/ui/pages/status/widgets/loading.dart';
import 'package:tickety_admission/ui/pages/status/widgets/no_ticket.dart';
import 'package:tickety_admission/ui/pages/status/widgets/ticket.dart';

// ignore: must_be_immutable
class StatusPage extends GetView<StatusPageController> {
  const StatusPage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, dynamic>>(
      future: controller.validateTicketSignature(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.data == null) {
            // * NO TICKET FOUND - DISPLAY ERROR MESSAGE!
            return NoTicketDataFound(
              message:
                  "${snapshot.data!["message"] ?? snapshot.data!["validationMessage"]}",
            );
          } else {
            // * DISPLAY TICKET DETAILS!
            return const TicketDetailsScreen();
          }
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          // * ERROR FETCHING DATA PROMPT USER TO RELOAD!
          return const ValidatingScreen();
        } else {
          // * ERROR FETCHING DATA PROMPT USER TO RELOAD!
          return const ErrorScreen();
        }
      },
    );
  }
}
