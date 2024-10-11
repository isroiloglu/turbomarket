import 'package:json_annotation/json_annotation.dart';

import 'login_response.dart';

part 'social_login_response.g.dart';

@JsonSerializable()
class SocialLoginResponse {
  LoginResponse? response;

  SocialLoginResponse({this.response});

  factory SocialLoginResponse.fromJson(Map<String, dynamic> json) =>
      _$SocialLoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SocialLoginResponseToJson(this);
}
