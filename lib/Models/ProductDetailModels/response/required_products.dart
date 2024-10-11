
import 'package:json_annotation/json_annotation.dart';
import 'detailed_params.dart';
import 'discounts.dart';
import 'main_pair.dart';
part 'required_products.g.dart';


@JsonSerializable()
class RequiredProducts {


  @JsonKey(name:"product_id")
  
  String? productId;
  @JsonKey(name:"product")
  
   String? product;
  @JsonKey(name:"product_type")
  
   String? productType;
  @JsonKey(name:"parent_product_id")
  
   String? parentProductId;
  @JsonKey(name:"master_product_offers_count")
  
   String? masterProductOffersCount;
  @JsonKey(name:"master_product_id")
  
   String? masterProductId;
  @JsonKey(name:"company_id")
  
   String? companyId;
  @JsonKey(name:"product_code")
  
   String? productCode;
  @JsonKey(name:"status")
  
   String? status;
  @JsonKey(name:"list_price")
  
   String? listPrice;
  @JsonKey(name:"amount")
  
   String? amount;
  @JsonKey(name:"weight")
  
   String? weight;
  @JsonKey(name:"length")
  
   String? length;
  @JsonKey(name:"width")
  
   String? width;
  @JsonKey(name:"height")
  
   String? height;
  @JsonKey(name:"shipping_freight")
  
   String? shippingFreight;
  @JsonKey(name:"low_avail_limit")
  
   String? lowAvailLimit;
  @JsonKey(name:"timestamp")
  
   String? timestamp;
  @JsonKey(name:"updated_timestamp")
  
   String? updatedTimestamp;
  @JsonKey(name:"usergroup_ids")
  
   String? usergroupIds;
  @JsonKey(name:"is_edp")
  
   String? isEdp;
  @JsonKey(name:"edp_shipping")
  
   String? edpShipping;
  @JsonKey(name:"unlimited_download")
  
   String? unlimitedDownload;
  @JsonKey(name:"tracking")
  
   String? tracking;
  @JsonKey(name:"free_shipping")
  
   String? freeShipping;
  @JsonKey(name:"zero_price_action")
  
   String? zeroPriceAction;
  @JsonKey(name:"is_pbp")
  
   String? isPbp;
  @JsonKey(name:"is_op")
  
   String? isOp;
  @JsonKey(name:"is_oper")
  
   String? isOper;
  @JsonKey(name:"is_returnable")
  
   String? isReturnable;
  @JsonKey(name:"return_period")
  
   String? returnPeriod;
  @JsonKey(name:"avail_since")
  
   String? availSince;
  @JsonKey(name:"out_of_stock_actions")
  
   String? outOfStockActions;
  @JsonKey(name:"localization")
  
   String? localization;
  @JsonKey(name:"min_qty")
  
   String? minQty;
  @JsonKey(name:"max_qty")
  
   String? maxQty;
  @JsonKey(name:"qty_step")
  
   String? qtyStep;
  @JsonKey(name:"list_qty_count")
  
   String? listQtyCount;
  @JsonKey(name:"tax_ids")
  
   String? taxIds;
  @JsonKey(name:"age_verification")
  
   String? ageVerification;
  @JsonKey(name:"age_limit")
  
   String? ageLimit;
  @JsonKey(name:"options_type")
  
   String? optionsType;
  @JsonKey(name:"exceptions_type")
  
   String? exceptionsType;
  @JsonKey(name:"details_layout")
  
   String? detailsLayout;
  @JsonKey(name:"shipping_params")
  
   String? shippingParams;
  @JsonKey(name:"facebook_obj_type")
  
   String? facebookObjType;
  @JsonKey(name:"buy_now_url")
  
   String? buyNowUrl;
  @JsonKey(name:"master_product_status")
  
   String? masterProductStatus;
  @JsonKey(name:"price")
  
   String? price;
  @JsonKey(name:"category_ids")
  
   List<int>? categoryIds;
  // @JsonKey(name:"main_category")
  //
  //  int? mainCategory;
  @JsonKey(name:"options_type_raw")
  
   Object? optionsTypeRaw;
  @JsonKey(name:"exceptions_type_raw")
  
   Object? exceptionsTypeRaw;
  @JsonKey(name:"tracking_raw")
  
   Object? trackingRaw;
  @JsonKey(name:"zero_price_action_raw")
  
   Object? zeroPriceActionRaw;
  @JsonKey(name:"min_qty_raw")
  
   Object? minQtyRaw;
  @JsonKey(name:"max_qty_raw")
  
   Object? maxQtyRaw;
  @JsonKey(name:"qty_step_raw")
  
   Object? qtyStepRaw;
  @JsonKey(name:"list_qty_count_raw")
  
   Object? listQtyCountRaw;
  @JsonKey(name:"details_layout_raw")
  
   String? detailsLayoutRaw;
  @JsonKey(name:"variation_features")
  
   List<Object>? variationFeatures;
  @JsonKey(name:"main_pair")
  
   MainPair? mainPair;
  @JsonKey(name:"base_price")
  
   String? basePrice;
  @JsonKey(name:"selected_options1")
  
   List<Object>? selectedOptions;
  @JsonKey(name:"has_options")
  
   bool? hasOptions;
  @JsonKey(name:"product_options")
  
   List<Object>? productOptions = null;
  @JsonKey(name:"discounts")
  
   Discounts? discounts;
  @JsonKey(name:"qty_content")
  
   List<Object>? qtyContent = null;
  @JsonKey(name:"detailed_params")
  
   DetailedParams? detailedParams;
  @JsonKey(name:"premoderation_reason")
  
   String? premoderationReason;
  @JsonKey(name:"bought")
  
   String? bought;

  @JsonKey(name: "item_id")
  Object? itemId;

  RequiredProducts({
     this.productId,
     this.product,
     this.productType,
     this.parentProductId,
     this.masterProductOffersCount,
     this.masterProductId,
     this.companyId,
     this.productCode,
     this.status,
     this.listPrice,
     this.amount,
     this.weight,
     this.length,
     this.width,
     this.height,
     this.shippingFreight,
     this.lowAvailLimit,
     this.timestamp,
     this.updatedTimestamp,
     this.usergroupIds,
     this.isEdp,
     this.edpShipping,
     this.unlimitedDownload,
     this.tracking,
     this.freeShipping,
     this.zeroPriceAction,
     this.isPbp,
     this.isOp,
     this.isOper,
     this.isReturnable,
     this.returnPeriod,
     this.availSince,
     this.outOfStockActions,
     this.localization,
     this.minQty,
     this.maxQty,
     this.qtyStep,
     this.listQtyCount,
     this.taxIds,
     this.ageVerification,
     this.ageLimit,
     this.optionsType,
     this.exceptionsType,
     this.detailsLayout,
     this.shippingParams,
     this.facebookObjType,
     this.buyNowUrl,
     this.masterProductStatus,
     this.price,
     this.categoryIds,
     // this.mainCategory,
     this.optionsTypeRaw,
     this.exceptionsTypeRaw,
     this.trackingRaw,
     this.zeroPriceActionRaw,
     this.minQtyRaw,
     this.maxQtyRaw,
     this.qtyStepRaw,
     this.listQtyCountRaw,
     this.detailsLayoutRaw,
     this.variationFeatures,
     this.mainPair,
     this.basePrice,
     this.selectedOptions,
     this.hasOptions,
     this.productOptions,
     this.discounts,
     this.qtyContent,
     this.detailedParams,
     this.premoderationReason,
     this.bought,
    this.itemId
  });

  factory RequiredProducts.fromJson(Map<String, dynamic> json) =>
      _$RequiredProductsFromJson(json);

  Map<String, dynamic> toJson() => _$RequiredProductsToJson(this);
}