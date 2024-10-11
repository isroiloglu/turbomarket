import 'package:json_annotation/json_annotation.dart';

import 'cart_data.dart';

part 'cart_model.g.dart';
@JsonSerializable()
class CartModel{
  @JsonKey(name:"cart")
  
   CartData? cart;
  @JsonKey(name:"error")
  
   bool? error;
  @JsonKey(name:"success")
  
   bool? success;
  @JsonKey(name:"message")
  
   String? message;
  @JsonKey(name:"product_total")
  
   int? productTotal;

  @JsonKey(name:"msg")
  
   String? msg;


   double? grandTotal;

   bool? emptyCartView;

   String? couponCode = "";

  CartModel({
     this.cart,
     this.error,
     this.success,
     this.message,
     this.productTotal,
     this.msg,
     this.grandTotal,
     this.emptyCartView,
     this.couponCode,
  });
 factory CartModel.fromJson(Map<String, dynamic> json) =>
      _$CartModelFromJson(json);

  Map<String, dynamic> toJson() => _$CartModelToJson(this);

}