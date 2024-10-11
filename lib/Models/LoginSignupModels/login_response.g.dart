// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    LoginResponse(
      userId: json['user_id'],
      companyId: json['company_id'] as String?,
      userType: json['user_type'] as String?,
      firstname: json['firstname'] as String?,
      lastname: json['lastname'] as String?,
      email: json['email'] as String?,
      multipleProfileEnable: json['multiple_profile_enable'] as bool?,
      productTotal: json['product_total'] as int?,
      isVendor: json['is_vendor'] as bool?,
      walletData: json['wallet_data'] == null
          ? null
          : WalletData.fromJson(json['wallet_data'] as Map<String, dynamic>),
      message: json['msg'] as String?,
      error: json['error'] as bool?,
      points: json['points'] as int?,
      phone: json['phone'] as String?,
    );

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'company_id': instance.companyId,
      'user_type': instance.userType,
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'email': instance.email,
      'multiple_profile_enable': instance.multipleProfileEnable,
      'product_total': instance.productTotal,
      'is_vendor': instance.isVendor,
      'wallet_data': instance.walletData,
      'msg': instance.message,
      'error': instance.error,
      'phone': instance.phone,
      'points': instance.points,
    };

Genders _$GendersFromJson(Map<String, dynamic> json) => Genders(
      gender: (json['gender'] as List<dynamic>?)
          ?.map((e) => Gender.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GendersToJson(Genders instance) => <String, dynamic>{
      'gender': instance.gender,
    };

Gender _$GenderFromJson(Map<String, dynamic> json) => Gender(
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? '',
    );

Map<String, dynamic> _$GenderToJson(Gender instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
