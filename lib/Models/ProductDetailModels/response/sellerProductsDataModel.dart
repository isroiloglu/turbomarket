import 'package:json_annotation/json_annotation.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/baseResponse/base_response.dart';

part 'sellerProductsDataModel.g.dart';

@JsonSerializable()
class SellerProductsDataModel extends BaseResponse{
  @JsonKey(name: "product_id")
  int? productId;

  @JsonKey(name: "company_id")
  String? companyId;

  @JsonKey(name: "company")
  String? company;

  @JsonKey(name: "city")
  String? city;

  @JsonKey(name: "country")
  String? country;

  @JsonKey(name: "price")
  double? price;

  @JsonKey(name: "formatprice")
  String? formatPrice;

  @JsonKey(name: "amount")
  String? amount;

  @JsonKey(name: "allow_add_to_cart")
  bool? allowAddToCart;

  @JsonKey(name: "logo")
  String? logo;

  @JsonKey(name: "in_stock")
  bool? inStock;

  @JsonKey(name: "backOrder")
  bool? backOrder;

  @JsonKey(name: "")
  bool? outOfStock;

  SellerProductsDataModel(
      {this.productId,
      this.companyId,
      this.company,
      this.city,
      this.country,
      this.price,
      this.formatPrice,
      this.amount,
      this.allowAddToCart,
      this.logo,
        this.outOfStock,
        this.backOrder,
      this.inStock});

  factory SellerProductsDataModel.fromJson(Map<String, dynamic> json) =>
      _$SellerProductsDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$SellerProductsDataModelToJson(this);
}
