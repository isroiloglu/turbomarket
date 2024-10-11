// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contactDetails.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContactDetails _$ContactDetailsFromJson(Map<String, dynamic> json) =>
    ContactDetails(
      json['address'] as String?,
      json['phone'] as String?,
      json['email'] as String?,
    );

Map<String, dynamic> _$ContactDetailsToJson(ContactDetails instance) =>
    <String, dynamic>{
      'address': instance.address,
      'phone': instance.phone,
      'email': instance.email,
    };
