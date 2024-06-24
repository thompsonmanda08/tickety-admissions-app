import 'package:get/get.dart';
import 'package:tickety_admission/services/admission_services.dart';
import 'package:tickety_admission/ui/pages/manual_admission/controller.dart';
import 'package:tickety_admission/ui/pages/status/controller.dart';

class ManualAdmissionBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<AdmissionServices>(AdmissionServices());
    Get.put<StatusPageController>(StatusPageController());
    Get.put<ManualAdmissionController>(ManualAdmissionController());
  }
}
