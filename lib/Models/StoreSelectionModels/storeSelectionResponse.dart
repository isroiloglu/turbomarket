import 'package:json_annotation/json_annotation.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/StoreSelectionModels/storeFronts.dart';
part 'storeSelectionResponse.g.dart';


@JsonSerializable()
class StoreSelectionResponse{

  @JsonKey(name:"success")
  bool? success;

  @JsonKey(name:"storefront_list")
  List<StoreFront>? storeFrontList;

  StoreSelectionResponse(this.success, this.storeFrontList);

  factory StoreSelectionResponse.fromJson(Map<String, dynamic> json) =>
      _$StoreSelectionResponseFromJson(json);

  Map<String, dynamic> toJson() => _$StoreSelectionResponseToJson(this);
}