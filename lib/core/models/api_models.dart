class Post {}

class Comment {}

class User {
  final String name;
  final String phoneNumber;

  User({this.name, this.phoneNumber});
}

class LoginResponse {
  final bool success;
  final String codeId;
  final String message;

  LoginResponse({this.success, this.codeId, this.message});
}

class VerifyCodeResponse {
  final bool success;
  final String codeId;
  final dynamic user;

  VerifyCodeResponse({this.success, this.codeId, this.user});
}
