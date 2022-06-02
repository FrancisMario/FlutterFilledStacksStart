import 'package:wcx/core/models/api_models.dart';

abstract class Api {
  Future<dynamic> loginPhone({String phone});
  Future<VerifyCodeResponse> verifyCode({String codeId, String code});
}
