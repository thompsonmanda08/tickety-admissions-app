import 'package:get/get.dart';
import 'package:tickety_admission/models/api_response.dart';
import 'package:tickety_admission/services/authenticated_service.dart';
import 'package:tickety_admission/tools/helpers.dart';


class TransactionsService extends AuthenticatedService {
  Future<APIServiceResponse<Map<String, dynamic>>> transactions() async {
    Response<dynamic> r = await get('api/v1/transactions/client');
    return unpackAPIResponse<Map<String, dynamic>>(r);
  }
}
