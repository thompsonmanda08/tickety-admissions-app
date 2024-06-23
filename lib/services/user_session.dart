import 'package:get/state_manager.dart';
import 'package:get_storage/get_storage.dart';

class UserSessionService extends GetxService {
  // ignore: prefer_function_declarations_over_variables
  static final _box = () => GetStorage('userSession');

  final _isLoggedIn = false.val("isLoggedIn", getBox: _box);
  final _authToken = "".val("authToken", getBox: _box);
  final _firstName = "".val("firstName", getBox: _box);
  final _lastName = "".val("lastName", getBox: _box);
  final _loginID = "".val("loginID", getBox: _box);
  final _userID = 0.val("userID", getBox: _box);
  final _isAdmin = false.val("isAdmin", getBox: _box);
  final _canAdmitTickets = false.val("canAdmitTickets", getBox: _box);
  final _canSaleTickets = false.val("canSaleTickets", getBox: _box);
  final _mobileNo = "".val("mobileNo", getBox: _box);
  final _emailAddress = "".val("emailAddress", getBox: _box);
  final _organiserID = 0.val("organiserID", getBox: _box);
  final _fingerprint = "".val("fingerprint", getBox: _box);
  final _fingerprintSignature = "".val("fingerprintSignature", getBox: _box);
  final _event = "".val("event", getBox: _box);

  String get authToken => _authToken.val;
  String get firstName => _firstName.val;
  String get lastName => _lastName.val;
  String get loginID => _loginID.val;
  bool get isLoggedIn => _isLoggedIn.val;
  bool get isAdmin => _isAdmin.val;
  bool get canAdmitTickets => _canAdmitTickets.val;
  bool get canSaleTickets => _canSaleTickets.val;
  String get mobileNo => _mobileNo.val;
  String get emailAddress => _emailAddress.val;
  int get organiserID => _organiserID.val;
  int get userID => _userID.val;
  String get fingerprint => _fingerprint.val;
  String get fingerprintSignature => _fingerprintSignature.val;
  String get event => _event.val;

  set authToken(String val) {
    _authToken.val = val;
  }

  set isLoggedIn(bool val) {
    _isLoggedIn.val = val;
  }

  set firstName(String val) {
    _firstName.val = val;
  }

  set lastName(String val) {
    _lastName.val = val;
  }

  set loginID(String val) {
    _loginID.val = val;
  }

  set isAdmin(bool val) {
    _isAdmin.val = val;
  }

  set canAdmitTickets(bool val) {
    _canAdmitTickets.val = val;
  }

  set canSaleTickets(bool val) {
    _canSaleTickets.val = val;
  }

  set mobileNo(String val) {
    _mobileNo.val = val;
  }

  set emailAddress(String val) {
    _emailAddress.val = val;
  }

  set organiserID(int val) {
    _organiserID.val = val;
  }

  set userID(int val) {
    _userID.val = val;
  }

  set fingerprint(String val) {
    _fingerprint.val = val;
  }

  set fingerprintSignature(String val) {
    _fingerprintSignature.val = val;
  }

  set event(String val) {
    _event.val = val;
  }

  void clear() {
    _authToken.val = "";
    _event.val = "";
    _isLoggedIn.val = false;
  }

  void stopUserSession() {
    _authToken.val = "";
    _event.val = "";
    _isLoggedIn.val = false;
  }

  void startUserSession(Map<String, dynamic> data) {
    isLoggedIn = true;
    authToken = "${data['authToken']}";
    loginID = "${data['authID']}";
    userID = data['userID'];
    firstName = "${data['firstName']}";
    lastName = "${data['lastName']}";
    isAdmin = data['isAdmin'];
    mobileNo = "${data['mobileNo']}";
    emailAddress = "${data['emailAddress']}";
    organiserID = data['organiserID'];
    canAdmitTickets = data['canAdmitTickets'];
    canSaleTickets = data['canSaleTickets'];
    fingerprint = "${data['fingerprint']}";
    fingerprintSignature = "${data['fingerprintSignature']}";
  }
}
