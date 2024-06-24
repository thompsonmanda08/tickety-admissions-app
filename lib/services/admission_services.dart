import 'package:get/get.dart';
import 'package:tickety_admission/models/api_response.dart';
import 'package:tickety_admission/services/authenticated_service.dart';
import 'package:tickety_admission/tools/helpers.dart';

class AdmissionServices extends AuthenticatedService {
// LOOK UP TICKET AFTER SCANNING
  Future<APIServiceResponse<Map<String, dynamic>>> validateTicketSignature({
    required String urlQuery,
  }) async {
    Response<dynamic> r = await get(
      '/main/tickets/validate$urlQuery',
    );

    // createLog("STATUS CODE: ${r.status.code}");
    // createLog("REQUEST URL: ${r.request?.url.toString()}");

    return unpackAPIResponse<Map<String, dynamic>>(r);
  }

  // LOOK UP TICKET AFTER MANUAL TICKET ENTRY
  Future<APIServiceResponse<Map<String, dynamic>>> validateTicketNumber({
    required int ticketNumber,
    required int eventId,
  }) async {
    Response<dynamic> r = await get(
        '/main/tickets/lookup-signature-string?eventID=$eventId&tkt=$ticketNumber');
    return unpackAPIResponse<Map<String, dynamic>>(r);
  }

  Future<APIServiceResponse<Map<String, dynamic>>> ticketAdmission({
    required int eventID,
    required int ticketID,
    required String ticketNo,
    required String signature,
  }) async {
    Response<dynamic> r = await post(
      '/main/tickets/admit',
      {
        'eventID': eventID,
        'ticketID': ticketID,
        'ticketNo': ticketNo,
        'signature': signature,
      },
    );
    return unpackAPIResponse<Map<String, dynamic>>(r);
  }
}
