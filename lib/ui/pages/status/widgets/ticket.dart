import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tickety_admission/tools/helpers.dart';
import 'package:tickety_admission/ui/pages/status/controller.dart';
import 'package:tickety_admission/ui/widgets/appbar.dart';
import 'package:tickety_admission/ui/widgets/button_2.dart';
import 'package:tickety_admission/ui/widgets/container_card.dart';
import 'package:tickety_admission/ui/widgets/svg_icon.dart';
import 'package:tickety_admission/ui/widgets/ticket_detail.dart';
import 'package:tickety_admission/values/colors.dart';

class TicketDetailsScreen extends GetView<StatusPageController> {
  const TicketDetailsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: CustomAppBar(
        onBackClick: controller.reset,
      ),
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
            // right: 20,
          ),
          child: Container(
            color: neutralColor300,
            height: screenSize.height,
            width: screenSize.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 24),

                // *********** TICKET VALIDITY STATUS CONTAINER **************//
                ContainerCard(
                  height: 130,
                  shadowOpacity: 0.0,
                  padding: const EdgeInsets.all(0),
                  backgroundColor:
                      controller.isValidTicket.value ? kGreenColor : kRedColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SVGIcon(
                        iconColor: Colors.white,
                        icon: controller.isValidTicket.value
                            ? "checkMarkIcon"
                            : "crossMarkIcon",
                        size: 70,
                      ),
                      Text(
                        controller.isValidTicket.value
                            ? "Valid Ticket"
                            : "Invalid Ticket",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          height: 2,
                        ),
                      ),
                      //******* INVALID TICKET MESSAGE **************//
                      // controller.isValidTicket.value
                      //     ? Text(
                      //         controller.ticketInvalidMessage.value,
                      //         style: const TextStyle(
                      //           color: Colors.white,
                      //           fontSize: 18,
                      //           fontWeight: FontWeight.w600,
                      //           height: 2,
                      //         ),
                      //       )
                      //     : const SizedBox.shrink(),
                    ],
                  ),
                ),
                // ****************************************************** //

                // *********** TICKET LOGO CONTAINER **************//
                Center(
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 36),
                    child: SVGIcon(
                      iconColor: Colors.black,
                      icon: "logo",
                      size: screenSize.width * 0.6,
                    ),
                  ),
                ),
                // ****************************************************** //
                // ****************************************************** //
                Text(
                  "${controller.session.event["eventName"]}",
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: neutralColor900,
                    letterSpacing: 0,
                    height: 2,
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const SVGIcon(
                              iconColor: neutralColor600,
                              icon: "calendarIcon",
                              size: 18,
                            ),
                            const SizedBox(width: 16),
                            Text(
                              "${controller.ticketDetails["occurrenceDate"]}",
                              textAlign: TextAlign.left,
                              style: const TextStyle(
                                fontSize: 18,
                                color: neutralColor600,
                                letterSpacing: 0,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const SVGIcon(
                              iconColor: neutralColor600,
                              icon: "locationIcon",
                              size: 18,
                            ),
                            const SizedBox(width: 16),
                            Text(
                              "${controller.session.event["venueName"]} - ${controller.ticketDetails["occurrenceName"]}",
                              textAlign: TextAlign.left,
                              style: const TextStyle(
                                fontSize: 16,
                                color: neutralColor600,
                                letterSpacing: 0,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                // ****************************************************** //

                // *********** TICKET INFORMATION CONTAINER **************//
                Column(
                  children: [
                    // TICKET DETAIL ITEM
                    Container(
                      padding: const EdgeInsets.only(bottom: 5),
                      decoration: const BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                        color: neutralColor500,
                        width: 1.0,
                      ))),
                      child: Row(
                        children: [
                          TicketDetail(
                            title: "Name",
                            detail:
                                "${controller.ticketDetails["payerName"]}, ${controller.ticketDetails["payerPhone"]}",
                          ),
                        ],
                      ),
                    ),

                    Container(
                      padding: const EdgeInsets.only(bottom: 5, top: 16),
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: neutralColor500,
                            width: 1.0,
                          ),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TicketDetail(
                            title: "Ticket Type",
                            detail:
                                "${controller.ticketDetails["ticketTypeName"]}",
                          ),
                          TicketDetail(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            title: "Ticket No",
                            detail: "${controller.ticketDetails["ticketNo"]}",
                          ),
                        ],
                      ),
                    ),

                    Container(
                      padding: const EdgeInsets.only(bottom: 5, top: 16),
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: neutralColor500,
                            width: 1.0,
                          ),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TicketDetail(
                            title: "Amount",
                            detail: formatCurrency(double.tryParse(
                                "${controller.ticketDetails["amount"] ?? 0}")),
                          ),
                          TicketDetail(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            title: "Admits",
                            detail:
                                "${controller.ticketDetails["admissionQty"]}",
                          ),
                        ],
                      ),
                    ),

                    Container(
                      padding: const EdgeInsets.only(bottom: 5, top: 16),
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: neutralColor500,
                            width: 1.0,
                          ),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TicketDetail(
                            title: "Price Type",
                            detail: "${controller.ticketDetails["priceType"]}",
                          ),
                          TicketDetail(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            title: "Payment Method",
                            detail: "${controller.ticketDetails["tenderType"]}",
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                // ****************************************************** //

                // *********** ACTION BUTTONS CONTAINER **************//
                const SizedBox(height: 24),
                controller.isValidTicket.value
                    ? Column(
                        children: [
                          Button(
                            text: "Admit",
                            backgroundColor: kPrimaryColor,
                            color: Colors.white,
                            borderRadius: 20,
                            height: 70,
                            fontSize: 20,
                            onTap: () => {controller.handleAdmission()},
                          ),
                          const SizedBox(height: 16),
                        ],
                      )
                    : const SizedBox.shrink(),
                Button(
                  text: "Cancel",
                  backgroundColor: kRedColor,
                  color: Colors.white,
                  borderRadius: 20,
                  height: 70,
                  fontSize: 20,
                  onTap: () {
                    Get.offNamed("/home");
                    controller.reset();
                  },
                ),

                //
                //
              ],
            ),
          ),
        ),
      ),
    );
  }
}
