import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tickety_admission/services/user_session.dart';

class AuthGuard extends GetMiddleware {
//   Get the auth service
  final UserSessionService _userSession = UserSessionService();

//   The default is 0 but you can update it to any number. The priority based
//   on the number of guards you have.
  @override
  int? get priority => 1;

  @override
  RouteSettings? redirect(String? route) {
    // Navigate to login if client is not authenticated other wise continue
    if (!_userSession.isLoggedIn) return const RouteSettings(name: "/login");
    return const RouteSettings(name: "/home");
  }
}
