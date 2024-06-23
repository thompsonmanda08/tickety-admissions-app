import 'package:get/get.dart';
import 'package:tickety_admission/models/api_response.dart';
import 'package:tickety_admission/services/authenticated_service.dart';
import 'package:tickety_admission/tools/helpers.dart';

class EventsService extends AuthenticatedService {
  Future<List<dynamic>> fetchAllEvents() async {
    Response<dynamic> r = await get('/main/events');

    APIServiceResponse<List<dynamic>> response =
        unpackAPIResponse<List<dynamic>>(r);

    List<dynamic>? eventsList = response.data;
    eventsList ??= [];
    return eventsList;
  }

  Future<APIServiceResponse<Map<String, dynamic>>> fetchEventById(
      eventId) async {
    Response<dynamic> r = await get('/main/events/$eventId');
    return unpackAPIResponse<Map<String, dynamic>>(r);
  }
}
