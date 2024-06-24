import 'package:get/get.dart';
import 'package:tickety_admission/models/api_response.dart';
import 'package:tickety_admission/services/manual_admission_service.dart';
import 'package:tickety_admission/services/user_session.dart';
import 'package:tickety_admission/tools/helpers.dart';

class ManualAdmissionController extends GetxController {
  final ManualAdmissionService _manualAdmissionService = Get.find<ManualAdmissionService>();
  final UserSessionService session = Get.find<UserSessionService>();
  var ticketDetails = <String, dynamic>{}.obs;
  var ticketNumber = "".obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchTicketDetails();
  }

  Future<void> fetchTicketDetails() async {
    isLoading.value = true;
    try {
      APIServiceResponse<Map<String, dynamic>> response =
          await _manualAdmissionService.ticket(
            ticketNumber: ticketNumber.value,
            eventId: '123333212'
          );
      ticketDetails.value = response.data ?? {};
    } catch (e) {
      createLog('Error fetching profile details: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
