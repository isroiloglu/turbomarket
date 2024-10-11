// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'storeData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StoreData _$StoreDataFromJson(Map<String, dynamic> json) => StoreData(
      json['store_name'] as String?,
      json['store_address'] as String?,
      json['store_time'] as String?,
      json['store_phone'] as String?,
    );

Map<String, dynamic> _$StoreDataToJson(StoreData instance) => <String, dynamic>{
      'store_name': instance.storeName,
      'store_address': instance.storeAddress,
      'store_time': instance.storeTime,
      'store_phone': instance.storePhone,
    };
