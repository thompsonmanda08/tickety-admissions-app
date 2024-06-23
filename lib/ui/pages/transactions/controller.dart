import 'package:get/get.dart';
import 'package:tickety_admission/models/api_response.dart';
import 'package:tickety_admission/services/events_service.dart';
import 'package:tickety_admission/tools/helpers.dart';

class TransactionsController extends GetxController {
  // final TransactionsService _transactionsService =
  //     Get.find<TransactionsService>();
  var transactions = <Map<String, dynamic>>[].obs;
  var filteredTransactions = <Map<String, dynamic>>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    // fetchTransactions();
  }

  // Future<void> fetchTransactions() async {
  //   isLoading.value = true;
  //   try {
  //     // APIServiceResponse<Map<String, dynamic>> response =
  //         // await _transactionsService.transactions();
  //     if (response.data != null) {
  //       transactions.value = List<Map<String, dynamic>>.from(
  //           response.data!['result']['transactions']);
  //       filteredTransactions.value = transactions;
  //     }
  //   } catch (e) {
  //     createLog('Error fetching transactions details: $e');
  //   } finally {
  //     isLoading.value = false;
  //   }
  // }

  void filterTransactions(String query) {
    if (query.isEmpty) {
      filteredTransactions.value = transactions;
    } else {
      filteredTransactions.value = transactions.where((transaction) {
        final to = transaction['to']?.toString().toLowerCase() ?? '';
        final date = transaction['date']?.toString() ?? '';
        final status = transaction['status']?.toString().toLowerCase() ?? '';
        final amount = transaction['amount']?.toString().toLowerCase() ?? '';

        return to.contains(query.toLowerCase()) ||
            date.contains(query) ||
            status.contains(query.toLowerCase()) ||
            amount.contains(query.toLowerCase());
      }).toList();
    }
  }
}
