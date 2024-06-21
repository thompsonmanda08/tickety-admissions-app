import 'package:get/get.dart';
import 'package:tickety_admission/models/api_response.dart';
import 'package:tickety_admission/services/login_service.dart';
import 'package:tickety_admission/services/user_session.dart';
import 'package:tickety_admission/tools/helpers.dart';
import 'package:tickety_admission/values/colors.dart';

class LoginController extends GetxController {
  final LoginService _loginService = Get.find<LoginService>();
  final UserSessionService userSessionService = Get.find<UserSessionService>();

  var phone = "".obs;
  var pin = "".obs;

  var isLoading = false.obs;

  void resetAll() {
    phone.value = "";
    pin.value = "";
  }

  Future<void> handleLogin() async {
    isLoading.value = true;
    try {
      APIServiceResponse<Map<String, dynamic>> serviceResponse =
          await _loginService.loginUser(
              phone: phone.value, pin: pin.value, role: "CLIENT");
      if (serviceResponse.statusCode == 200) {
        userSessionService.startUserSession(serviceResponse.data!);
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
