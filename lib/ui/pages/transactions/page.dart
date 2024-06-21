// ignore_for_file: library_private_types_in_public_api

import 'package:get/get.dart';
import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:tickety_admission/ui/pages/profile/controller.dart';
import 'package:tickety_admission/ui/pages/transactions/controller.dart';
import 'package:tickety_admission/ui/widgets/avatar.dart';
import 'package:tickety_admission/ui/widgets/empty.dart';
import 'package:tickety_admission/ui/widgets/n_bage.dart';
import 'package:tickety_admission/ui/widgets/search.dart';
import 'package:tickety_admission/ui/widgets/transaction_tile.dart';
import 'package:tickety_admission/values/colors.dart';

class Transactions extends StatefulWidget {
  final NotchBottomBarController? controller;

  const Transactions({super.key, this.controller});

  @override
  _TransactionsState createState() => _TransactionsState();
}

class _TransactionsState extends State<Transactions> {
  final TransactionsController transactionsController =
      Get.put(TransactionsController());
  final ProfileController profileController = Get.put(ProfileController());

  @override
  void initState() {
    super.initState();
    transactionsController.fetchTransactions();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Avatar(
                      firstName: profileController.profileDetails['profile']
                          ['firstName'],
                      lastName: profileController.profileDetails['profile']
                          ['lastName']),
                  const SizedBox(width: 10.0),
                  Expanded(
                    child: Search(
                      onSearch: transactionsController.filterTransactions,
                    ),
                  ),
                  const SizedBox(width: 10.0),
                  const NotificationBage(),
                ],
              ),
              const SizedBox(height: 10.0),
              Obx(() {
                if (transactionsController.isLoading.value) {
                  return SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.7,
                    child: const Center(
                      child: CircularProgressIndicator(
                        color: kPrimaryColor,
                      ),
                    ),
                  );
                } else if (transactionsController
                    .filteredTransactions.isEmpty) {
                  return const Empty();
                } else {
                  return Expanded(
                    child: ListView.builder(
                      itemCount:
                          transactionsController.filteredTransactions.length,
                      itemBuilder: (context, index) {
                        final transaction =
                            transactionsController.filteredTransactions[index];
                        return TransactionTile(
                          narration: transaction['to'] ?? '',
                          amount: transaction['amount'] ?? 0.0,
                          date: transaction['date'] ?? '',
                          transactionType: 'MobileMoneyTransfer',
                          status: transaction['status'] ?? 'PENDING',
                        );
                      },
                    ),
                  );
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
}
