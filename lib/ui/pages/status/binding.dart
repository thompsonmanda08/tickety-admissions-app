import 'package:get/get.dart';
import 'package:tickety_admission/services/admission_services.dart';
import 'package:tickety_admission/services/user_session.dart';
import 'package:tickety_admission/ui/pages/manual_admission/controller.dart';

import 'controller.dart';

class StatusPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(UserSessionService());
    Get.put<AdmissionServices>(AdmissionServices());
    Get.put<ManualAdmissionController>(ManualAdmissionController());
    Get.put(StatusPageController());
  }
}
