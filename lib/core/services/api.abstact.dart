import 'package:wcx/core/models/api_models.dart';

abstract class Api {
  Future<LoginResponse> loginPhone({String phone});
  Future<VerifyCodeResponse> verifyCode({String codeId, String code});
}