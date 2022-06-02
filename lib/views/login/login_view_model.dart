import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:logger/logger.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:wcx/core/locator.dart';
import 'package:wcx/core/logger.dart';
import 'package:wcx/core/router_constants.dart';
import 'package:wcx/core/services/authentication.dart';
import 'package:wcx/core/services/fake_api.dart';
import 'dart:io' show Platform;

class LoginViewModel extends ReactiveViewModel {
  Logger log;
  final DialogService _dialogService = locator<DialogService>();
  final NavigationService _navigationService = locator<NavigationService>();
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  final HttpApi _apiService = locator<HttpApi>();

  StreamController<ErrorAnimationType> errorController = StreamController();

  var codeStage = false;

  var wrongCode = false;

  var codeLength = 4;

  LoginViewModel() {
    log = getLogger(this.runtimeType.toString());
  }

  setCodeStage(bool v) {
    codeStage = v;
    notifyListeners();
  }

  Future login({
    @required String phone,
  }) async {
    setBusy(true);
    var result = await _authenticationService.login(phone);
    setBusy(false);

    if (result is bool) {
      if (result) {
        // _navigationService.navigateTo(mainViewRoute);
        setCodeStage(true);
      } else {
        await _dialogService.showDialog(
            title: 'Login Failure',
            description: 'General login failure. Please try again later',
            dialogPlatform: DialogPlatform.Material);
      }
    } else {
      await _dialogService.showDialog(
          title: 'Login Failure',
          description: "Please Try Again.",
          dialogPlatform: DialogPlatform.Material);
    }
  }

  Future<bool> verify2faCode({
    @required String code,
  }) async {
    wrongCode = false;
    setBusy(true);
    var result = await _authenticationService.verifyCode(code);
    setBusy(false);

    if (result is bool) {
      if (result) {
        _navigationService.navigateTo(mainViewRoute);
        return true;
      } else {
        await _dialogService.showDialog(
            title: 'Login Failure',
            description: 'Invalid Code, Please Enter try again.',
            dialogPlatform: DialogPlatform.Material);
        wrongCode = true;
        return false;
      }
    } else {
      await _dialogService.showDialog(
          title: 'Login Failure',
          description: "Please Try Again.",
          dialogPlatform: DialogPlatform.Material);
    }
  }

  @override
  List<ReactiveServiceMixin> get reactiveServices => [];
}
