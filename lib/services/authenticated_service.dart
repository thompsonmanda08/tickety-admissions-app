import 'package:get/get.dart';
import 'package:tickety_admission/services/api_service.dart';

import 'user_session.dart';

abstract class AuthenticatedService extends ApiService {
  final UserSessionService session = UserSessionService();

  @override
  void onInit() {
    super.onInit();

    httpClient.addRequestModifier<dynamic>((request) {
      // if (!request.url.path.contains("/Authentication") && session.isLoggedIn) {
      if (session.isLoggedIn) {
        request.headers['Authorization'] = 'Bearer ${session.authToken}';
        request.headers['ContextFingerprint'] = session.fingerprint;
      }

      return request;
    });

    httpClient.addResponseModifier<dynamic>((request, response) {
      return response;
    });

    httpClient.addAuthenticator<dynamic>((request) async {
      Get.toNamed('/login');
      return request;
    });

    httpClient.maxAuthRetries = 3;
  }
}
