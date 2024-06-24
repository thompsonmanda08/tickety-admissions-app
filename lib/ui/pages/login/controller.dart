import 'package:get/get.dart';
import 'package:tickety_admission/models/api_response.dart';
import 'package:tickety_admission/services/login_service.dart';
import 'package:tickety_admission/services/user_session.dart';
import 'package:tickety_admission/tools/helpers.dart';
import 'package:tickety_admission/values/colors.dart';

class LoginController extends GetxController {
  final LoginService _loginService = Get.find<LoginService>();
  final UserSessionService userSessionService = Get.find<UserSessionService>();

  var authID = "".obs;
  var authPassword = "".obs;

  var isLoading = false.obs;

  void resetAll() {
    authID.value = "";
    authPassword.value = "";
  }

  Future<void> handleLogin() async {
    isLoading.value = true;
    try {
      APIServiceResponse<Map<String, dynamic>> serviceResponse =
          await _loginService.loginUser(
        authID: authID.value,
        authPassword: authPassword.value,
      );

      if (serviceResponse.statusText == "success") {
        var sessionData = serviceResponse.data;
        // createLog('Login successful for user ${sessionData}');
        userSessionService.startUserSession(sessionData!);
        showSnackBar(
          title: 'Success',
          message: '${serviceResponse.message}',
        );
        Get.offAllNamed('/home');
      } else {
        showSnackBar(
          title: 'Error',
          message: '${serviceResponse.message}',
          backgroundColor: kRedColor,
        );
      }
    } catch (e) {
      showAlertBox(
        type: 'error',
        title: 'Error',
        message: 'Oops! Something went wrong',
      );
    } finally {
      isLoading.value = false;
    }
  }
}
