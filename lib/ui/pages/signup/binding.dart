import 'package:get/get.dart';
import 'package:tickety_admission/services/sign_up_services.dart';
import 'package:tickety_admission/ui/pages/signup/controller.dart';

class SignUpBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<SignUpService>(SignUpService());
    Get.put<SignUpController>(SignUpController());
  }
}
