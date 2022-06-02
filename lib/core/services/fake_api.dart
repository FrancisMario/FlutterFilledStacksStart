import 'package:flutter/cupertino.dart';

import 'api.abstact.dart';
import 'dart:async';
import 'dart:io';
import 'package:wcx/core/models/api_models.dart';

class HttpApi implements Api {
  @override
  Future<LoginResponse> loginPhone({@required String phone}) {
    return Future.delayed(Duration(seconds: 2), () {
      return LoginResponse(success: true, codeId: '12345', message: 'Success');
    });
  }

  @override
  Future<VerifyCodeResponse> verifyCode({String codeId, String code}) {
    return Future.delayed(Duration(seconds: 1), () {
      bool success = false;
      if (code == '1234') success = true;
      var user = {
        'firstname': "John",
        'lastname': "Doe",
        'phone': "3247034",
        'token': "1234567890",
      };
      return VerifyCodeResponse(success: success, codeId: '1234', user: user);
    });
  }
}
