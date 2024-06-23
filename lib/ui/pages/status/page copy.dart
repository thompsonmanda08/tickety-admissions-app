import 'package:flutter/material.dart';
import 'package:tickety_admission/ui/widgets/appbar.dart';
import 'package:tickety_admission/ui/widgets/button_2.dart';
import 'package:tickety_admission/ui/widgets/container_card.dart';
import 'package:tickety_admission/ui/widgets/svg_icon.dart';
import 'package:tickety_admission/ui/widgets/ticket_detail.dart';
import 'package:tickety_admission/values/colors.dart';

// ignore: must_be_immutable
class StatusPage extends StatelessWidget {
  const StatusPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const CustomAppBar(),
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
              children: [
                const SizedBox(height: 24),

                // *********** TICKET VALIDITY STATUS CONTAINER **************//
                const ContainerCard(
                  height: 130,
                  shadowOpacity: 0.0,
                  padding: EdgeInsets.all(0),
                  backgroundColor: kGreenColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SVGIcon(
                        iconColor: Colors.white,
                        icon: "checkMarkIcon",
                        size: 70,
                      ),
                      Text(
                        "Valid Ticket",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          height: 2,
                        ),
                      ),
                    ],
                  ),
                ),
                // ****************************************************** //

                // *********** TICKET LOGO CONTAINER **************//
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 36),
                  child: SVGIcon(
                    iconColor: Colors.black,
                    icon: "logo",
                    size: screenSize.width * 0.6,
                  ),
                ),
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
                      child: const Row(
                        children: [
                          TicketDetail(
                            title: "Patron",
                            detail: "Detail Information",
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
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TicketDetail(
                            title: "Ticket Type",
                            detail: "VIP",
                          ),
                          TicketDetail(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            title: "Ticket No",
                            detail: "100019",
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
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TicketDetail(
                            title: "Amount",
                            detail: "K450",
                          ),
                          TicketDetail(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            title: "Admits",
                            detail: "1",
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
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TicketDetail(
                            title: "Price Type",
                            detail: "Standard",
                          ),
                          TicketDetail(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            title: "Payment Method",
                            detail: "MTN Money",
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                // ****************************************************** //

                // *********** ACTION BUTTONS CONTAINER **************//
                const SizedBox(height: 48),
                Column(
                  children: [
                    Button(
                      text: "Admit",
                      backgroundColor: kPrimaryColor,
                      color: Colors.white,
                      borderRadius: 20,
                      height: 70,
                      fontSize: 20,
                      onTap: () => {},
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
                Button(
                  text: "Cancel",
                  backgroundColor: kRedColor,
                  color: Colors.white,
                  borderRadius: 20,
                  height: 70,
                  fontSize: 20,
                  onTap: () => {},
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
