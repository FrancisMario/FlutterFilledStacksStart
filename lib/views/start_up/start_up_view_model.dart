import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:wcx/core/locator.dart';
import 'package:wcx/core/logger.dart';
import 'package:wcx/core/services/authentication.dart';

import '../../core/router_constants.dart';

class StartUpViewModel extends BaseViewModel {
  Logger log;

  StartUpViewModel() {
    this.log = getLogger(this.runtimeType.toString());
  }

   final AuthenticationService _authenticationService = locator<AuthenticationService>();
  final NavigationService _navigationService = locator<NavigationService>();

  Future handleStartUpLogic() async {
    var hasLoggedInUser = await _authenticationService.isUserLoggedIn();

    if (hasLoggedInUser) {
      log.d('user is logged in');
      _navigationService.navigateTo(mainViewRoute);
    } else {
      log.d('user is not logged it, redireting to login screen');
      _navigationService.navigateTo(loginViewRoute);
    }
  }
}
