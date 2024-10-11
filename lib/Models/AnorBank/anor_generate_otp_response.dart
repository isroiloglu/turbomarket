/*
 *  Webkul Software.
 *
 *  @package  Mobikul Application Code.
 *  @Category Mobikul
 *  @author Webkul <support@webkul.com>
 *  @Copyright (c) Webkul Software Private Limited (https://webkul.com)
 *  @license https://store.webkul.com/license.html 
 *  @link https://store.webkul.com/license.html
 *
 */

import 'package:json_annotation/json_annotation.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/baseResponse/base_response.dart';

part 'anor_generate_otp_response.g.dart';

@JsonSerializable()
class AnorGenerateOtpResponse  extends BaseResponse{

  @JsonKey(name:"card_id")
  dynamic cardId;

  @JsonKey(name:"refresh_token")
  String? refreshToken;




  AnorGenerateOtpResponse({
    this.cardId,
    this.refreshToken,
  });

  factory AnorGenerateOtpResponse.fromJson(Map<String, dynamic> json) =>
      _$AnorGenerateOtpResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AnorGenerateOtpResponseToJson(this);
}