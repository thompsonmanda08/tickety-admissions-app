import 'package:get/get.dart';
import 'package:tickety_admission/ui/pages/manualadmission/controller.dart';

class ManualAdmissionBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ManualAdmissionController>(ManualAdmissionController());
  }
}
