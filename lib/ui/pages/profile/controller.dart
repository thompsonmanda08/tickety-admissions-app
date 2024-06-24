import 'package:get/get.dart';
import 'package:tickety_admission/models/api_response.dart';
import 'package:tickety_admission/services/profile_service.dart';
import 'package:tickety_admission/services/user_session.dart';
import 'package:tickety_admission/tools/helpers.dart';

class ProfileController extends GetxController {
  UserSessionService userSessionService = Get.find<UserSessionService>();
  final ProfileService _profileService = Get.find<ProfileService>();
  var profileDetails = <String, dynamic>{}.obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchProfileDetails();
  }

  void signUserOut() {
    userSessionService.stopUserSession();
    Get.offAllNamed("/login");
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
