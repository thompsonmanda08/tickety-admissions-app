import 'package:tickety_admission/models/api_response.dart';
import 'package:get/get.dart';
import 'package:tickety_admission/services/authenticated_service.dart';
import 'package:tickety_admission/tools/helpers.dart';

class PayService extends AuthenticatedService {
  Future<APIServiceResponse<Map<String, dynamic>>> pay({
    required String merchantNumber,
    required String amount,
    required String phone,
    required String sender,
    required String customerReference,
  }) async {
    Response<dynamic> r = await post(
      'api/v1/transactions/merchant/$merchantNumber/pay',
      {
        'amount': amount,
        'phone': phone,
        'sender': sender,
        'customerReference': customerReference,
      },
    );
    return unpackAPIResponse<Map<String, dynamic>>(r);
  }
}
