import 'package:get/get.dart';
import 'package:tickety_admission/models/api_response.dart';
import 'package:tickety_admission/services/profile_service.dart';
import 'package:tickety_admission/tools/helpers.dart';

class ProfileController extends GetxController {
  final ProfileService _profileService = Get.find<ProfileService>();
  var profileDetails = <String, dynamic>{}.obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchProfileDetails();
  }

  Future<void> fetchProfileDetails() async {
    isLoading.value = true;
    try {
      APIServiceResponse<Map<String, dynamic>> response =
          await _profileService.profile();
      profileDetails.value = response.data ?? {};
    } catch (e) {
      createLog('Error fetching profile details: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
