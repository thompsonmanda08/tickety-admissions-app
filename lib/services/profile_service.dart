import 'package:get/get.dart';
import 'package:tickety_admission/models/api_response.dart';
import 'package:tickety_admission/services/authenticated_service.dart';
import 'package:tickety_admission/tools/helpers.dart';

class ProfileService extends AuthenticatedService {
  Future<APIServiceResponse<Map<String, dynamic>>> profile() async {
    Response<dynamic> r = await get('api/v1/clients/profile');
    return unpackAPIResponse<Map<String, dynamic>>(r);
  }
}
