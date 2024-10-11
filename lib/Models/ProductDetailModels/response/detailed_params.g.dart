// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detailed_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetailedParams _$DetailedParamsFromJson(Map<String, dynamic> json) =>
    DetailedParams(
      detailedParams: json['detailed_params'] as bool?,
      featuresDisplayOn: json['features_display_on'] as String?,
      getActiveOptions: json['get_active_options'] as bool?,
      getAdditional: json['get_additional'] as bool?,
      getDetailed: json['get_detailed'] as bool?,
      getDiscounts: json['get_discounts'] as bool?,
      getExtra: json['get_extra'] as bool?,
      getFeatures: json['get_features'] as bool?,
      getForOneProduct: json['get_for_one_product'] as bool?,
      getIcon: json['get_icon'] as bool?,
      getOptions: json['get_options'] as bool?,
      getProductType: json['get_product_type'] as bool?,
      getTaxedPrices: json['get_taxed_prices'] as bool?,
      getVariationFeaturesVariants:
          json['get_variation_features_variants'] as bool?,
      getVariationInfo: json['get_variation_info'] as bool?,
      getVariationName: json['get_variation_name'] as bool?,
      getVendorProductIds: json['get_vendor_product_ids'] as bool?,
      getVendorProducts: json['get_vendor_products'] as bool?,
      runtimeCompanyId: json['runtime_company_id'] as int?,
    );

Map<String, dynamic> _$DetailedParamsToJson(DetailedParams instance) =>
    <String, dynamic>{
      'get_icon': instance.getIcon,
      'get_detailed': instance.getDetailed,
      'get_additional': instance.getAdditional,
      'get_options': instance.getOptions,
      'get_discounts': instance.getDiscounts,
      'get_features': instance.getFeatures,
      'get_extra': instance.getExtra,
      'get_taxed_prices': instance.getTaxedPrices,
      'get_for_one_product': instance.getForOneProduct,
      'detailed_params': instance.detailedParams,
      'features_display_on': instance.featuresDisplayOn,
      'get_active_options': instance.getActiveOptions,
      'get_variation_info': instance.getVariationInfo,
      'get_variation_features_variants': instance.getVariationFeaturesVariants,
      'get_variation_name': instance.getVariationName,
      'get_product_type': instance.getProductType,
      'get_vendor_products': instance.getVendorProducts,
      'get_vendor_product_ids': instance.getVendorProductIds,
      'runtime_company_id': instance.runtimeCompanyId,
    };
