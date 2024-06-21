import 'package:get/get.dart';
import 'package:tickety_admission/ui/pages/profile/controller.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ProfileController>(ProfileController());
  }
}
