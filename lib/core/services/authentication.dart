import 'package:flutter/cupertino.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wcx/core/logger.dart';
import 'package:wcx/core/models/api_models.dart';
import 'package:wcx/core/services/fake_api.dart';

class AuthenticationService {
  Logger log = getLogger('Locator Injector');

  HttpApi _api = HttpApi();

  Future<dynamic> login(String phone) async {
    var result = await _api.loginPhone(phone: phone);
    if (result is LoginResponse) {
      final SharedPreferences _prefs = await SharedPreferences.getInstance();
      if (result.success) {
        // persist codeid
        return _prefs.setString('codeId', result.codeId);
      }
      return false;
    } else {
      return null;
    }
  }

  Future<dynamic> verifyCode(String code) async {
    final SharedPreferences _prefs = await SharedPreferences.getInstance();
    var result;
    var codeId;

    codeId = _prefs.getString('codeId');
    if (codeId == null) {
      return null;
    }

    result = await _api.verifyCode(code: code, codeId: codeId);
    if (result is VerifyCodeResponse) {
      if (result.success) {
        // persist user
        return true;
        _prefs.setString('user', result.user.toString());
      }
      return false;
    } else {
      return null;
    }
  }

  Future<bool> isUserLoggedIn() async {
    final SharedPreferences _prefs = await SharedPreferences.getInstance();
    final String user = _prefs.getString('user');
    log.d(user);
    return user != null;
  }
}
