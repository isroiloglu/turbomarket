// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartModel _$CartModelFromJson(Map<String, dynamic> json) => CartModel(
      cart: json['cart'] == null
          ? null
          : CartData.fromJson(json['cart'] as Map<String, dynamic>),
      error: json['error'] as bool?,
      success: json['success'] as bool?,
      message: json['message'] as String?,
      productTotal: json['product_total'] as int?,
      msg: json['msg'] as String?,
      grandTotal: (json['grandTotal'] as num?)?.toDouble(),
      emptyCartView: json['emptyCartView'] as bool?,
      couponCode: json['couponCode'] as String?,
    );

Map<String, dynamic> _$CartModelToJson(CartModel instance) => <String, dynamic>{
      'cart': instance.cart,
      'error': instance.error,
      'success': instance.success,
      'message': instance.message,
      'product_total': instance.productTotal,
      'msg': instance.msg,
      'grandTotal': instance.grandTotal,
      'emptyCartView': instance.emptyCartView,
      'couponCode': instance.couponCode,
    };
