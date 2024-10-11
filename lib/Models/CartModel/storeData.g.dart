// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'storeData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StoreData _$StoreDataFromJson(Map<String, dynamic> json) => StoreData(
      storeAddress: json['store_address'] as String?,
      storeId: json['store_Id'] as String?,
      storeItem: json['store_item'] as String?,
      storeName: json['store_name'] as String?,
      storePhone: json['store_phone'] as String?,
    );

Map<String, dynamic> _$StoreDataToJson(StoreData instance) => <String, dynamic>{
      'store_address': instance.storeAddress,
      'store_Id': instance.storeId,
      'store_name': instance.storeName,
      'store_phone': instance.storePhone,
      'store_item': instance.storeItem,
    };
