import 'package:get/get.dart';
import 'package:tickety_admission/services/api_service.dart';

import 'user_session.dart';

abstract class AuthenticatedService extends ApiService {
  final UserSessionService _userSession = UserSessionService();

  @override
  void onInit() {
    super.onInit();

    httpClient.addRequestModifier<dynamic>((request) {
      if (!request.url.path.contains("/Authentication") &&
          _userSession.isLoggedIn) {
        request.headers['Authorization'] = 'Bearer ${_userSession.authToken}';
      }

      return request;
    });

    httpClient.addResponseModifier<dynamic>((request, response) {
      return response;
    });

    httpClient.addAuthenticator<dynamic>((request) async {
      Get.offAllNamed('/login');
      return request;
    });

    httpClient.maxAuthRetries = 1;
  }
}
