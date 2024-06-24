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
  var isLoading = false.obs;
  var manualValidation = false.obs;

  void reset() {
    ticketNumber.value = "";
  }

  final isValidTicketNo = false.obs;

  Future<Map<String, dynamic>> validateTicketSignature() async {
    try {
      APIServiceResponse serviceResponse =
          await _admissionServices.validateTicketSignature(
        eventID: session.event["eventID"],
        ticketNo: int.parse(ticketNumber.value),
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
    manualValidation.value = true;
    try {
      APIServiceResponse<Map<String, dynamic>> response =
          await _admissionServices.validateTicketNumber(
        ticketNumber: int.parse(ticketNumber.value),
        eventId: session.event["eventID"],
      );
      ticketDetails.value = response.data ?? {};
      if (response.statusText == "success") {
        // STATUS VARIABLES HERE
        isValidTicketNo.value = true;
        reset();
        Get.toNamed('/status');
      } else {
        showAlertBox(
          type: 'error',
          title: 'Error: Invalid Ticket',
          message: '${response.message}',
        );
      }
    } catch (e) {
      createLog('Error fetching: $e');
    } finally {
      isLoading.value = false;
      manualValidation.value = false;
    }
  }

  Future<void> handleAdmission() async {
    isLoading.value = true;
    try {
      APIServiceResponse<Map<String, dynamic>> response =
          await _admissionServices.ticketAdmission(
        eventID: ticketDetails['eventID'],
        ticketID: ticketDetails['ticketID'],
        ticketNo: ticketDetails['ticketNo'],
        signature: ticketDetails['signature'],
      );
      if (response.statusText == "success") {
        showSnackBar(
          title: 'Success',
          message: '${response.message}',
        );
        Get.offAllNamed('/home');
      } else {
        showAlertBox(
          type: 'error',
          title: 'Error',
          message: '${response.message}',
        );
      }
    } catch (e) {
      showAlertBox(
        type: 'error',
        title: 'Error',
        message: 'Oops! Something went wrong',
      );
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onInit() async {
    super.onInit();
  }
}
