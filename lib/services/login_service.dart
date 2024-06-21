import 'package:get/get.dart';
import 'package:tickety_admission/models/api_response.dart';
import 'package:tickety_admission/services/api_service.dart';
import 'package:tickety_admission/tools/helpers.dart';

class LoginService extends ApiService {
  Future<APIServiceResponse<Map<String, dynamic>>> loginUser({
    required String phone,
    required String pin,
    required String role,
  }) async {
    Response<dynamic> r = await post(
      'api/v1/auth/login',
      {
        'phone': phone,
        'pin': pin,
        'role': role
      },
    );
    return unpackAPIResponse<Map<String, dynamic>>(r);
  }
}
