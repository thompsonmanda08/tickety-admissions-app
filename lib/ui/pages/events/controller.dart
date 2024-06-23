// ignore_for_file: avoid_print

import 'package:get/get.dart';
import 'package:tickety_admission/services/events_service.dart';
import 'package:tickety_admission/services/user_session.dart';
import 'package:tickety_admission/tools/helpers.dart';

class EventsController extends GetxController {
  final UserSessionService session = Get.find<UserSessionService>();
  final EventsService _eventsService = Get.find<EventsService>();
  var events = [].obs;
  var event = <String, dynamic>{}.obs;
  var selectedEventName = "".obs;
  var selectedEventId = 0.obs;
  var isLoading = false.obs;

  @override
  void onInit() async {
    super.onInit();
    await getEvents();
  }

  void handleChangeSessionEvent() {
    // CHANGE THE SESSION EVENT
    session.event = event;
    createLog("Session Event Changed: $event");
    Get.offAllNamed('/home');
  }

  Future<void> getEvents() async {
    isLoading.value = true;
    try {
      List<dynamic> eventsList = await _eventsService.fetchAllEvents();
      print("RESPONSE DATA: ");
      // print(serviceResponse.data);

      if (eventsList != []) {
        events.value = eventsList;
        event.value = eventsList[0];
        session.event = event;
      }
    } catch (e) {
      print(e);
      createLog("$e");
      return;
    } finally {
      isLoading.value = false;
    }
  }

  // Future<dynamic> getEventById(eventId) async {
  //   isLoading.value = true;
  //   try {
  //     APIServiceResponse<dynamic> serviceResponse =
  //         await _eventsService.fetchEventById(eventId);
  //     if (serviceResponse.statusText == "success" &&
  //         serviceResponse.data != null) {
  //       return serviceResponse.data;
  //     } else {
  //       showSnackBar(
  //         title: 'Error',
  //         message: '${serviceResponse.message}',
  //         backgroundColor: kRedColor,
  //       );
  //     }
  //   } catch (e) {
  //     createLog("$e");
  //   } finally {
  //     isLoading.value = false;
  //   }
  // }
}
