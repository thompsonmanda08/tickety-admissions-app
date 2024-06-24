import 'package:get/get.dart';
import 'package:tickety_admission/services/admission_services.dart';
import 'package:tickety_admission/services/profile_service.dart';
import 'package:tickety_admission/services/user_session.dart';
import 'package:tickety_admission/ui/pages/home/controller.dart';
import 'package:tickety_admission/ui/pages/profile/controller.dart';
import 'package:tickety_admission/ui/pages/status/controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<AdmissionServices>(AdmissionServices());
    Get.put<ProfileService>(ProfileService());
    Get.put<UserSessionService>(UserSessionService());
    Get.put(StatusPageController());
    Get.put<ProfileController>(ProfileController());
    Get.put<HomeController>(HomeController());
  }
}
