// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_screen_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeScreenModels _$HomeScreenModelsFromJson(Map<String, dynamic> json) =>
    HomeScreenModels(
      json['customer_image'] as String?,
      json['theme_type'] as int?,
      json['app_version'] as int?,
      json['default_language'] as String?,
      json['default_currency'] as String?,
      json['default_currency_symbol'] as String?,
      (json['active_languages'] as List<dynamic>?)
          ?.map((e) => ActiveLanguages.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['active_currencies'] as List<dynamic>?)
          ?.map((e) => ActiveCurrency.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['company_id'] as String?,
      (json['categories'] as List<dynamic>?)
          ?.map((e) => Categories.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['products'] as List<dynamic>?)
          ?.map((e) => Products.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['brand'] as List<dynamic>?)
          ?.map((e) => Brands.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['pages'] as List<dynamic>?)
          ?.map((e) => CMSPage.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['banner'] as List<dynamic>?)
          ?.map((e) => Banners.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['contactDetails'] == null
          ? null
          : ContactDetails.fromJson(
              json['contactDetails'] as Map<String, dynamic>),
      (json['promotions'] as List<dynamic>?)
          ?.map((e) => Promotions.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['product_total'] as int?,
    );

Map<String, dynamic> _$HomeScreenModelsToJson(HomeScreenModels instance) =>
    <String, dynamic>{
      'customer_image': instance.customerImage,
      'product_total': instance.productTotal,
      'theme_type': instance.themeType,
      'app_version': instance.appVersion,
      'default_language': instance.defaultLanguage,
      'default_currency': instance.defaultCurrency,
      'default_currency_symbol': instance.defaultCurrencySymbol,
      'active_languages': instance.activeLanguageList,
      'active_currencies': instance.activeCurrencyList,
      'company_id': instance.companyId,
      'categories': instance.categoryList,
      'products': instance.productList,
      'brand': instance.brandList,
      'pages': instance.pageList,
      'banner': instance.bannerList,
      'contactDetails': instance.contactDetails,
      'promotions': instance.promotionList,
    };
