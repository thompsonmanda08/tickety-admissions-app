import 'package:get/get.dart';
import 'package:tickety_admission/models/api_response.dart';
import 'package:tickety_admission/services/pay_service.dart';
import 'package:tickety_admission/tools/helpers.dart';

class PayController extends GetxController {
  final PayService _payService = Get.find<PayService>();

  var phone = ''.obs;
  var amount = ''.obs;
  var sender = ''.obs;
  var merchantNumber = ''.obs;

  var isLoading = false.obs;

  void resetAll() {
    phone.value = "";
    amount.value = "";
    sender.value = "";
    merchantNumber.value = '';
  }

  Future<void> handlePayment() async {
    isLoading.value = true;
    try {
      APIServiceResponse<Map<String, dynamic>> serviceResponse =
          await _payService.pay(
              merchantNumber: merchantNumber.value,
              phone: phone.value,
              amount: amount.value,
              sender: sender.value,
              customerReference: 'Payment for goods');

      if (serviceResponse.statusCode == 200) {
        Get.toNamed('/status');
      } else {
        showAlertBox(
          type: 'error',
          title: 'Error',
          message: '${serviceResponse.message}',
        );
      }
    } catch (e) {
      showAlertBox(
        type: 'error',
        title: 'Error',
        message: 'Oops! Something went wrong, please try again',
      );
    } finally {
      isLoading.value = false;
    }
  }
}
