import 'package:json_annotation/json_annotation.dart';
part 'contactDetails.g.dart';


@JsonSerializable()
class ContactDetails{

  @JsonKey(name:"address")
  String? address;

  @JsonKey(name:"phone")
  String? phone;

  @JsonKey(name:"email")
  String? email;

  ContactDetails(this.address, this.phone, this.email);


  factory ContactDetails.fromJson(Map<String, dynamic> json) =>
      _$ContactDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$ContactDetailsToJson(this);
}



/*"": "Tashkent, Republic of Uzbekistan, Tashkent city, Humo street 57",
        "": "+998712303883",
        "": "info@all4u.market"*/