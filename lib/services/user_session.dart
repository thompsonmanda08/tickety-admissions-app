import 'package:get/state_manager.dart';
import 'package:get_storage/get_storage.dart';

class UserSessionService extends GetxService {
  // ignore: prefer_function_declarations_over_variables
  static final _box = () => GetStorage('userSession');

  final _isLoggedIn = false.val("isLoggedIn", getBox: _box);
  final _authToken = "".val("authToken", getBox: _box);


  String get authToken => _authToken.val;
  bool get isLoggedIn => _isLoggedIn.val;

  set authToken(String val) {
    _authToken.val = val;
  }

  set isLoggedIn(bool val) {
    _isLoggedIn.val = val;
  }

  void clear() {
    _authToken.val = "";
    _isLoggedIn.val = false;
  }

  void stopUserSession() {
    _authToken.val = "";
    _isLoggedIn.val = false;
  }

  void startUserSession(Map<String, dynamic> data) {
    isLoggedIn = true;
    authToken = "${data['token']}";
  }
}
