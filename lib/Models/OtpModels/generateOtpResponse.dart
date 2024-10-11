
import 'package:json_annotation/json_annotation.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/baseResponse/base_response.dart';
part 'generateOtpResponse.g.dart';

@JsonSerializable()
class GenerateOtpResponse extends BaseResponse{

  @JsonKey(name:"sms_response")
  String? sms;

  @JsonKey(name:"otp")
  String? otp;

  @JsonKey(name:"expire_time")
  String? expireTime;




  GenerateOtpResponse({
    this.expireTime, this.otp, this.sms
  });

  factory GenerateOtpResponse.fromJson(Map<String, dynamic> json) =>
      _$GenerateOtpResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GenerateOtpResponseToJson(this);

}