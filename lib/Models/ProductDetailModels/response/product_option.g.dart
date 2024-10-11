// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_option.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductOption _$ProductOptionFromJson(Map<String, dynamic> json) =>
    ProductOption(
      optionId: json['option_id'] as int?,
      productId: json['product_id'],
      companyId: json['company_id'],
      optionType: json['option_type'] as String?,
      inventory: json['inventory'],
      regexp: json['regexp'] as String?,
      required: json['required'] as String?,
      multiupload: json['multiupload'],
      allowedExtensions: json['allowed_extensions'],
      maxFileSize: json['max_file_size'],
      missingVariantsHandling: json['missing_variants_handling'],
      status: json['status'],
      position: json['position'],
      value: json['value'],
      optionName: json['option_name'] as String?,
      optionText: json['option_text'] as String?,
      description: json['description'] as String?,
      innerHint: json['inner_hint'] as String?,
      incorrectMessage: json['incorrect_message'] as String?,
      comment: json['comment'] as String?,
      variants: (json['variants'] as List<dynamic>?)
          ?.map((e) => Variant.fromJson(e as Map<String, dynamic>))
          .toList(),
      isConfigured: json['configured'] as bool?,
    );

Map<String, dynamic> _$ProductOptionToJson(ProductOption instance) =>
    <String, dynamic>{
      'option_id': instance.optionId,
      'product_id': instance.productId,
      'company_id': instance.companyId,
      'option_type': instance.optionType,
      'inventory': instance.inventory,
      'regexp': instance.regexp,
      'required': instance.required,
      'multiupload': instance.multiupload,
      'allowed_extensions': instance.allowedExtensions,
      'max_file_size': instance.maxFileSize,
      'missing_variants_handling': instance.missingVariantsHandling,
      'status': instance.status,
      'position': instance.position,
      'value': instance.value,
      'option_name': instance.optionName,
      'option_text': instance.optionText,
      'description': instance.description,
      'inner_hint': instance.innerHint,
      'incorrect_message': instance.incorrectMessage,
      'comment': instance.comment,
      'variants': instance.variants,
      'configured': instance.isConfigured,
    };
