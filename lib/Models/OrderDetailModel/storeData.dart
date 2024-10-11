import 'package:json_annotation/json_annotation.dart';
part 'storeData.g.dart';

@JsonSerializable()
class StoreData{

  @JsonKey(name:"store_name")
  String? storeName;

  @JsonKey(name:"store_address")
  String? storeAddress;

  @JsonKey(name:"store_time")
  String? storeTime;

  @JsonKey(name:"store_phone")
  String? storePhone;

  StoreData(this.storeName, this.storeAddress, this.storeTime, this.storePhone);


  factory StoreData.fromJson(Map<String, dynamic> json) =>
      _$StoreDataFromJson(json);

  Map<String, dynamic> toJson() => _$StoreDataToJson(this);
}