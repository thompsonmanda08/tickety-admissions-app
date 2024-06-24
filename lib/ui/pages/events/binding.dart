import 'package:get/get.dart';
import 'package:tickety_admission/services/events_service.dart';
import 'package:tickety_admission/services/login_service.dart';
import 'package:tickety_admission/ui/pages/events/controller.dart';
import 'package:tickety_admission/ui/pages/login/controller.dart';

class EventsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<LoginService>(LoginService());
    Get.put<EventsService>(EventsService());
    Get.put<LoginController>(LoginController());
    Get.put<EventsController>(EventsController());
  }
}
