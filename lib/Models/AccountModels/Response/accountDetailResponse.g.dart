// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'accountDetailResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountDetailResponse _$AccountDetailResponseFromJson(
        Map<String, dynamic> json) =>
    AccountDetailResponse(
      json['success'] as bool?,
      json['user_id'] as String?,
      json['status'] as String?,
      json['user_type'] as String?,
      json['is_root'] as String?,
      json['company_id'] as String?,
      json['firstname'] as String?,
      json['lastname'] as String?,
      json['email'] as String?,
      json['phone'] as String?,
      (json['profiles'] as List<dynamic>?)
          ?.map((e) => Profiles.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['multiple_profile_enable'] as bool?,
      (json['country_list'] as List<dynamic>?)
          ?.map((e) => CountryList.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['message'] as String?,
    );

Map<String, dynamic> _$AccountDetailResponseToJson(
        AccountDetailResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'user_id': instance.userId,
      'status': instance.status,
      'user_type': instance.userType,
      'is_root': instance.isRoot,
      'company_id': instance.companyId,
      'firstname': instance.firstName,
      'lastname': instance.lastName,
      'email': instance.email,
      'phone': instance.phone,
      'profiles': instance.profileList,
      'multiple_profile_enable': instance.multipleProfileEnable,
      'country_list': instance.countryList,
    };
