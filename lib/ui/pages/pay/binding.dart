import 'package:get/get.dart';
import 'package:tickety_admission/services/pay_service.dart';
import 'package:tickety_admission/ui/pages/home/controller.dart';

class PayBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<PayService>(PayService());
    Get.put<HomeController>(HomeController());
  }
}
