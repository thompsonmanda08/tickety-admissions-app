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
  var isValidTicket = false.obs;
  var ticketInvalidMessage = "".obs;

  void reset() {
    // ticketNumber.value = "";
    urlQuery.value = "";
    isValidTicket.value = false;
    ticketInvalidMessage.value = "";
    ticketDetails.value = {};
  }

  final isValidTicketNo = false.obs;

  Future<Map<String, dynamic>> validateTicketSignature() async {
    try {
      APIServiceResponse serviceResponse =
          await _admissionServices.validateTicketSignature(
        urlQuery: urlQuery.value,
      );
      // createLog("URL QUERY: ${urlQuery.value}");

      // // createLog("RESPONSE DATA: ${serviceResponse.data}");

      createLog("SERVER RESPONSE: ${serviceResponse.message}");
      createLog("RESPONSE DATA: ${serviceResponse.data}");

      if (serviceResponse.statusText == "success") {
        isValidTicket.value = serviceResponse.data['isValid'];
        ticketDetails.value = serviceResponse.data ?? {};
        ticketInvalidMessage.value = "${serviceResponse.message}";
        return serviceResponse.data;
      } else {
        isValidTicket.value = false;
        ticketInvalidMessage.value = "${serviceResponse.message}";
        var error = {
          "message": "${serviceResponse.message}",
          "data": null,
          "error": true,
        };
        return error;
      }
    } catch (e) {
      var error = {
        "message": "Sorry! There was an error!",
        "data": null,
        "error": true,
      };
      return error;
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
      createLog("RES: ${response.data}");
      if (response.statusText == "success") {
        // STATUS VARIABLES HERE
        // ticketDetails.value = response.data ?? {};
        urlQuery.value = response.data!["signatureString"];
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
    }
  }

  Future<void> handleAdmission() async {
    isLoading.value = true;
    try {
      APIServiceResponse<Map<String, dynamic>> response =
          await _admissionServices.ticketAdmission(
        eventID: ticketDetails['eventID'],
        ticketID: ticketDetails['ticketID'],
        ticketNo: ticketDetails['ticketNo'].toString(),
        signature: ticketDetails['signature'].toString(),
      );
      if (response.statusText == "success") {
        await showAlertBox(
          type: "success",
          title: 'Success',
          message: '${response.message}',
        );
        Get.offAllNamed('/home');
      } else {
        showAlertBox(
          type: 'error',
          title: 'Server Error',
          message: '${response.message}',
        );
      }
    } catch (e) {
      showAlertBox(
        type: 'error',
        title: 'Error',
        message: 'Oops! Something went wrong $e',
      );
    } finally {
      isLoading.value = false;
    }
  }
}
