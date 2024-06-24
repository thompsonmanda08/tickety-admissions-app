import 'package:get/get.dart';
import 'package:tickety_admission/ui/pages/manual_admission/controller.dart';

class ManualAdmissionBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ManualAdmissionController>(ManualAdmissionController());
  }
}
