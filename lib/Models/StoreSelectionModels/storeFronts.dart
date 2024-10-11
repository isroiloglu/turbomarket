
import 'package:json_annotation/json_annotation.dart';
part 'storeFronts.g.dart';


@JsonSerializable()
class StoreFront{

  @JsonKey(name:"storefront_id")
  String? storefrontId;

  @JsonKey(name:"url")
  String? url;

  @JsonKey(name:"name")
  String? name;

  @JsonKey(name:"is_default")
  String? isDefault;

  StoreFront(this.storefrontId, this.url, this.name, this.isDefault);

  factory StoreFront.fromJson(Map<String, dynamic> json) =>
      _$StoreFrontFromJson(json);

  Map<String, dynamic> toJson() => _$StoreFrontToJson(this);
}


