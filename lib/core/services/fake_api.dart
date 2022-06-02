import 'api.abstact.dart';
import 'dart:async';
import 'dart:io';
import 'package:wcx/core/models/api_models.dart';

class HttpApi implements Api {

  @override
  Future<LoginResponse> loginPhone({String phone}) {
    return Future.delayed(Duration(seconds: 1), ()  {
      return LoginResponse(success:true,codeId:'12345',message:'Success');
    });
  }

    @override
  Future<VerifyCodeResponse> verifyCode({String codeId, String code}) {
    return Future.delayed(Duration(seconds: 1), () {
      bool success = false;
      if(code == '12345') success = true; 
      return VerifyCodeResponse(success:success, codeId:'1234');
    });
  }

}