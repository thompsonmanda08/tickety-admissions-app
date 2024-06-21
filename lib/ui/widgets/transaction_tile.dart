import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tickety_admission/tools/helpers.dart';
import 'package:tickety_admission/values/colors.dart';


class TransactionTile extends StatelessWidget {
  const TransactionTile({
    super.key,
    required this.narration,
    required this.date,
    required this.amount,
    this.transactionType,
    this.status,
    this.balance,
  });

  final String date;
  final double amount;
  final String? status;
  final String? balance;
  final String narration;
  final String? transactionType;

  @override
  Widget build(BuildContext context) {
    String icon;
    String formattedAmount = "- ${formatCurrency(amount)}";
    Color amountColor = balance != null ? kRedColor : primaryColor900;

    // Set the status color based on the status value
    Color statusColor;
    switch (status) {
      case 'PENDING':
        statusColor = kYellowColor;
        break;
      case 'SUCCESSFUL':
        statusColor = kGreenColor;
        break;
      case 'FAILED':
        statusColor = kRedColor;
        break;
      default:
        statusColor = Colors.black;
    }

    switch (transactionType) {
      case "AirtimePurchase":
        icon = "mobile.svg";
        break;
      case "MobileMoneyWalletDeposit":
      case "ReceiveMoney":
        // Debits
        icon = "deposit.svg";
        if (balance != null) {
          formattedAmount = "+ ${formatCurrency(amount)}";
          amountColor = kGreenColor;
        }
        break;
      case "MobileMoneyTransfer":
      case "BankTransfer":
        icon = "pay.svg";
        break;
      default:
        icon = "transfer.svg";
        break;
    }

    return Container(
      height: 70,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.all(12),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        shadows: const [
          BoxShadow(
            color: Color(0x0C000000),
            blurRadius: 2,
            offset: Offset(-2, 4),
            spreadRadius: 0,
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                constraints: const BoxConstraints(maxHeight: 50, maxWidth: 50),
                decoration: ShapeDecoration(
                  color: kPrimaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: SvgPicture.asset(
                  'assets/icons/$icon',
                  width: 24,
                  colorFilter: const ColorFilter.mode(
                    Colors.white,
                    BlendMode.srcIn,
                  ),
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    narration,
                    style: const TextStyle(
                      color: primaryColor900,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    formatDateTime(date),
                    style: const TextStyle(
                      color: neutralColor600,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                balance != null ? formattedAmount : formatCurrency(amount),
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: amountColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              status != null
                  ? Text(
                      status!.toLowerCase(),
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: statusColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  : const SizedBox.shrink(),
              balance != null
                  ? Text(
                      balance ?? '',
                      textAlign: TextAlign.right,
                      style: const TextStyle(
                        color: primaryColor900,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    )
                  : const SizedBox.shrink(),
            ],
          ),
        ],
      ),
    );
  }
}
