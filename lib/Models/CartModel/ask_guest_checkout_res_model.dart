import 'package:json_annotation/json_annotation.dart';
part 'ask_guest_checkout_res_model.g.dart';
@JsonSerializable()
class AskGuestCheckoutResModel{
  @JsonKey(name: "disable_checkout")
  bool? disableCheckout;

  AskGuestCheckoutResModel({this.disableCheckout});

  factory AskGuestCheckoutResModel.fromJson(Map<String, dynamic> json) =>
      _$AskGuestCheckoutResModelFromJson(json);

  Map<String, dynamic> toJson() => _$AskGuestCheckoutResModelToJson(this);
}