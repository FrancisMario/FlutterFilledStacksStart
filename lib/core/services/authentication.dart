import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wcx/core/logger.dart';

class AuthenticationService {

  Logger log = getLogger('Locator Injector');
  
  Future<bool> isUserLoggedIn() async {
  final SharedPreferences _prefs = await SharedPreferences.getInstance();
    final String user = _prefs.getString('user');
    log.d(user);
    return user != null;
  }
}