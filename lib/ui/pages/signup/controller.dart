import 'package:get/get.dart';
import 'package:tickety_admission/models/api_response.dart';
import 'package:tickety_admission/services/sign_up_services.dart';
import 'package:tickety_admission/tools/helpers.dart';
import 'package:tickety_admission/values/colors.dart';

class SignUpController extends GetxController {
  final SignUpService _signUpService = Get.find<SignUpService>();
  var firstName = "".obs;
  var lastName = "".obs;
  var phone = "".obs;
  var email = "".obs;
  var pin = "".obs;

  var isLoading = false.obs;

  void resetAll() {
    firstName.value = "";
    lastName.value = "";
    phone.value = "";
    email.value = "";
    pin.value = "";
  }

  Future<void> handleSignUp() async {
    isLoading.value = true;
    try {
      APIServiceResponse<Map<String, dynamic>> serviceResponse =
          await _signUpService.registerUser(
        firstName: firstName.value,
        lastName: lastName.value,
        phone: phone.value,
        email: email.value,
        pin: pin.value,
        role: 'CLIENT',
      );
      if (serviceResponse.statusCode == 201) {
        showSnackBar(
          title: 'Success',
          message: '${serviceResponse.message}',
        );
        Get.toNamed('/login');
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
