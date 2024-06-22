import 'package:get/get.dart';
import 'package:tickety_admission/ui/pages/reports/controller.dart';

class ReportsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ReportsController>(ReportsController());
  }
}
