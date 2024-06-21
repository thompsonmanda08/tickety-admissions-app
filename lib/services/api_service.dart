
import 'package:get/get.dart';
import 'package:tickety_admission/values/config.dart';

class ApiService extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = apiBaseURL;
    httpClient.timeout = const Duration(seconds: 60);
    httpClient.addResponseModifier<dynamic>((request, response) {
      return response;
    });
  }
}
