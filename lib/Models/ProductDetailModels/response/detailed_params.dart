import 'package:json_annotation/json_annotation.dart';

part 'detailed_params.g.dart';
@JsonSerializable()
class DetailedParams{
  @JsonKey(name:"get_icon")
  
  bool? getIcon;
  @JsonKey(name:"get_detailed")
  
  bool? getDetailed;
  @JsonKey(name:"get_additional")
  
  bool? getAdditional;
  @JsonKey(name:"get_options")
  
  bool? getOptions;
  @JsonKey(name:"get_discounts")
  
  bool? getDiscounts;
  @JsonKey(name:"get_features")
  
  bool? getFeatures;
  @JsonKey(name:"get_extra")
  
  bool? getExtra;
  @JsonKey(name:"get_taxed_prices")
  
  bool? getTaxedPrices;
  @JsonKey(name:"get_for_one_product")
  
  bool? getForOneProduct;
  @JsonKey(name:"detailed_params")
  
  bool? detailedParams;
  @JsonKey(name:"features_display_on")
  
  String? featuresDisplayOn;
  @JsonKey(name:"get_active_options")
  
  bool? getActiveOptions;
  @JsonKey(name:"get_variation_info")
  
  bool? getVariationInfo;
  @JsonKey(name:"get_variation_features_variants")
  
  bool? getVariationFeaturesVariants;
  @JsonKey(name:"get_variation_name")
  
  bool? getVariationName;
  @JsonKey(name:"get_product_type")
  
  bool? getProductType;
  @JsonKey(name:"get_vendor_products")
  
  bool? getVendorProducts;
  @JsonKey(name:"get_vendor_product_ids")
  
  bool? getVendorProductIds;
  @JsonKey(name:"runtime_company_id")
  
  int? runtimeCompanyId;

  DetailedParams({this.detailedParams, this.featuresDisplayOn, this.getActiveOptions, this.getAdditional, this.getDetailed, this.getDiscounts, this.getExtra, this.getFeatures, this.getForOneProduct, this.getIcon, this.getOptions, this.getProductType, this.getTaxedPrices, this.getVariationFeaturesVariants, this.getVariationInfo, this.getVariationName, this.getVendorProductIds, this.getVendorProducts, this.runtimeCompanyId});

  factory DetailedParams.fromJson(Map<String, dynamic> json) =>
      _$DetailedParamsFromJson(json);

  Map<String, dynamic> toJson() => _$DetailedParamsToJson(this);
}