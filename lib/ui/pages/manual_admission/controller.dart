import 'package:get/get.dart';
import 'package:tickety_admission/models/api_response.dart';
import 'package:tickety_admission/services/admission_services.dart';
import 'package:tickety_admission/services/user_session.dart';
import 'package:tickety_admission/tools/helpers.dart';

class ManualAdmissionController extends GetxController {
  final AdmissionServices _admissionServices = Get.find<AdmissionServices>();
  final UserSessionService session = Get.find<UserSessionService>();
  var ticketDetails = <String, dynamic>{}.obs;
  var ticketNumber = "".obs;
  var isLoading = false.obs;

  Future<Map<String, dynamic>> validateTicketSignature() async {
    try {
      APIServiceResponse serviceResponse =
          await _admissionServices.validateTicketSignature(
        eventID: session.event["eventID"],
        ticketNo: ticketNumber.value,
        signature: session.fingerprintSignature,
      );

      if (serviceResponse.statusText == "success") {
        print(serviceResponse.data!);
        Get.toNamed("/status", arguments: serviceResponse.data!);
        return serviceResponse.data!;
      } else {
        showAlertBox(
          type: "error",
          title: "Ticket Not Found",
          message: "${serviceResponse.message}",
        );
        return {};
      }
    } catch (e) {
      // ignore: avoid_print
      print(e);
      return {};
    }
  }

  Future<void> validateTicketNumber() async {
    isLoading.value = true;
    try {
      APIServiceResponse<Map<String, dynamic>> response =
          await _admissionServices.validateTicketNumber(
        ticketNumber: ticketNumber.value,
        eventId: session.event["eventID"],
      );
      ticketDetails.value = response.data ?? {};
    } catch (e) {
      createLog('Error fetching profile details: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
