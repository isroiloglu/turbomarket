// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'storeSelectionResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StoreSelectionResponse _$StoreSelectionResponseFromJson(
        Map<String, dynamic> json) =>
    StoreSelectionResponse(
      json['success'] as bool?,
      (json['storefront_list'] as List<dynamic>?)
          ?.map((e) => StoreFront.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$StoreSelectionResponseToJson(
        StoreSelectionResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'storefront_list': instance.storeFrontList,
    };
