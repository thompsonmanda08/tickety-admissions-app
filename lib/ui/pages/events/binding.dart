import 'package:get/get.dart';
import 'package:tickety_admission/ui/pages/events/controller.dart';

class EventsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<EventsController>(EventsController());
  }
}
