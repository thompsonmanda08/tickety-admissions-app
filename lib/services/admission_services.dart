import 'package:get/get.dart';
import 'package:tickety_admission/models/api_response.dart';
import 'package:tickety_admission/services/api_service.dart';
import 'package:tickety_admission/tools/helpers.dart';

class AdmissionServices extends ApiService {
// LOOK UP TICKET AFTER SCANNING
  Future<APIServiceResponse<Map<String, dynamic>>> validateTicketSignature({
    required String eventID,
    required String ticketNo,
    required String signature,
  }) async {
    Response<dynamic> r = await get(
      ' /main/tickets/validate?eventID=$eventID&tkt=$ticketNo&signature=$signature',
    );
    return unpackAPIResponse<Map<String, dynamic>>(r);
  }

  // LOOK UP TICKET AFTER MANUAL TICKET ENTRY
  Future<APIServiceResponse<Map<String, dynamic>>> validateTicketNumber({
    required String ticketNumber,
    required String eventId,
  }) async {
    Response<dynamic> r = await get(
        '/main/tickets/lookup-signature-string?eventID=$eventId&tkt=$ticketNumber');
    return unpackAPIResponse<Map<String, dynamic>>(r);
  }

  Future<APIServiceResponse<Map<String, dynamic>>> ticketAdmission({
    required String eventID,
    required String ticketID,
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
