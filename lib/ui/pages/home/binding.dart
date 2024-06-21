import 'package:get/get.dart';
import 'package:tickety_admission/services/pay_service.dart';
import 'package:tickety_admission/services/profile_service.dart';
import 'package:tickety_admission/services/transactions_service.dart';
import 'package:tickety_admission/ui/pages/home/controller.dart';
import 'package:tickety_admission/ui/pages/pay/controller.dart';
import 'package:tickety_admission/ui/pages/profile/controller.dart';
import 'package:tickety_admission/ui/pages/transactions/controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<PayService>(PayService());
    Get.put<ProfileService>(ProfileService());
    Get.put<ProfileController>(ProfileController());
    Get.put<PayController>(PayController());
    Get.put<HomeController>(HomeController());
    Get.put<TransactionsService>(TransactionsService());
    Get.put<TransactionsController>(TransactionsController());
  }
}
