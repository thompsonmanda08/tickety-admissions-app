import 'package:get/get.dart';
import 'package:tickety_admission/models/api_response.dart';
import 'package:tickety_admission/services/api_service.dart';
import 'package:tickety_admission/tools/helpers.dart';

class SignUpService extends ApiService {
  Future<APIServiceResponse<Map<String, dynamic>>> registerUser({
    required String firstName,
    required String lastName,
    required String phone,
    required String email,
    required String pin,
    required String role,
  }) async {
    Response<dynamic> r = await post(
      'api/v1/auth/register',
      {
        'firstName': firstName,
        'lastName': lastName,
        'phone': phone,
        'email': email,
        'pin': pin,
        'role': role,
      },
    );
    return unpackAPIResponse<Map<String, dynamic>>(r);
  }
}
