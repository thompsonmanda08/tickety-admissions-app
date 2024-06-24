import 'package:get/get.dart';
import 'package:tickety_admission/models/api_response.dart';
import 'package:tickety_admission/services/api_service.dart';
import 'package:tickety_admission/tools/helpers.dart';

class LoginService extends ApiService {
  Future<APIServiceResponse<Map<String, dynamic>>> loginUser({
    required String authID,
    required String authPassword,
  }) async {
    Response<dynamic> r = await post(
      '/auth/login',
      {
        "authID": authID,
        "authPassword": authPassword,
      },
    );
    return unpackAPIResponse<Map<String, dynamic>>(r);
  }
}
