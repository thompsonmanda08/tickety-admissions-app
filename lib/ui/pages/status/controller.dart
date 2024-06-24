import 'package:get/get.dart';
import 'package:tickety_admission/models/api_response.dart';
import 'package:tickety_admission/services/admission_services.dart';
import 'package:tickety_admission/services/user_session.dart';
import 'package:tickety_admission/tools/helpers.dart';

class StatusPageController extends GetxController {
  final UserSessionService session = UserSessionService();
  final AdmissionServices _admissionServices = Get.find<AdmissionServices>();
  var ticketDetails = <String, dynamic>{}.obs;
  var ticketNumber = "".obs;
  var urlQuery = "".obs;
  var isLoading = false.obs;
  var manualValidation = false.obs;

  void reset() {
    ticketNumber.value = "";
    urlQuery.value = "";
  }

  final isValidTicketNo = false.obs;

  Future<Map<String, dynamic>> validateTicketSignature() async {
    try {
      APIServiceResponse serviceResponse =
          await _admissionServices.validateTicketSignature(
        urlQuery: urlQuery.value,
      );
      createLog("URL QUERY: ${urlQuery.value}");

      // createLog("RESPONSE DATA: ${serviceResponse.data}");

      ticketDetails.value = serviceResponse.data ?? {};
      createLog("SERVER RESPONSE: ${serviceResponse.message}");
      createLog("RESPONSE DATA: ${serviceResponse.data}");
      return {};
      // if (serviceResponse.statusText == "success") {

      //   return serviceResponse.data!;
      // } else {
      //   showAlertBox(
      //     type: "error",
      //     title: "Ticket Not Found",
      //     message: "${serviceResponse.message}",
      //   );
      //   return {};
      // }
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
        ticketNumber: int.parse(ticketNumber.value),
        eventId: session.event["eventID"],
      );

      if (response.statusText == "success") {
        // STATUS VARIABLES HERE
        ticketDetails.value = response.data ?? {};
        urlQuery.value = ticketDetails["signatureString"];
        if (urlQuery.value.isNotEmpty) {
          Get.toNamed('/status');
        }
      } else {
        showAlertBox(
          type: 'error',
          title: 'Error: Invalid Ticket',
          message: '${response.message}',
        );
        return;
      }
    } catch (e) {
      createLog('Error fetching: $e');
    } finally {
      isLoading.value = false;
      manualValidation.value = false;
    }
  }
}
