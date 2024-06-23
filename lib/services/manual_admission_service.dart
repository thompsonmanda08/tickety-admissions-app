import 'package:get/get.dart';
import 'package:tickety_admission/models/api_response.dart';
import 'package:tickety_admission/services/authenticated_service.dart';
import 'package:tickety_admission/tools/helpers.dart';

class ManualAdmissionService extends AuthenticatedService {
  Future<APIServiceResponse<Map<String, dynamic>>> ticket({
    required String ticketNumber,
    required String eventId,
  }) async {
    Response<dynamic> r = await get(
        '/main/tickets/lookup-signature-string?eventID=$eventId&tkt=$ticketNumber');
    return unpackAPIResponse<Map<String, dynamic>>(r);
  }
}
