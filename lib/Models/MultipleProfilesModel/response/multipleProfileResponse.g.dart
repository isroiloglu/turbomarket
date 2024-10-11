// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'multipleProfileResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MultipleProfilesResponse _$MultipleProfilesResponseFromJson(
        Map<String, dynamic> json) =>
    MultipleProfilesResponse(
      users: (json['users'] as List<dynamic>?)
          ?.map((e) => ProfileUserModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      params: json['params'] == null
          ? null
          : Params.fromJson(json['params'] as Map<String, dynamic>),
    )
      ..success = json['success'] as bool?
      ..message = json['message'] as String?
      ..error = json['error']
      ..msg = json['msg'] as String?
      ..countryList = (json['countries'] as List<dynamic>?)
          ?.map((e) => CountryList.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$MultipleProfilesResponseToJson(
        MultipleProfilesResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'error': instance.error,
      'msg': instance.msg,
      'users': instance.users,
      'params': instance.params,
      'countries': instance.countryList,
    };
