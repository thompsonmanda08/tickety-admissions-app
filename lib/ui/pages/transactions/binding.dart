import 'package:get/get.dart';
import 'package:tickety_admission/ui/pages/transactions/controller.dart';


class TransactionsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<TransactionsController>(TransactionsController());
  }
}
