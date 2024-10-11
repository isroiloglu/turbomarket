// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartProduct _$CartProductFromJson(Map<String, dynamic> json) => CartProduct(
      product: json['product'] as String?,
      subtotal: (json['subtotal'] as num?)?.toDouble(),
      qty: json['amount'],
      productId: json['product_id'],
      cartItemQtyChanged: json['cartItemQtyChanged'] as bool?,
      company: json['company'] as String?,
      companyId: json['company_id'],
      displayPrice: (json['display_price'] as num?)?.toDouble(),
      formatDisplayPrice: json['format_display_price'],
      formatSubtotal: json['format_subtotal'],
      imagePath: json['image_path'] as String?,
      isUpdateAllow: json['is_update_allow'] as bool?,
      itemId: json['item_id'],
      productCode: json['product_code'] as String?,
      productOptions: (json['product_options'] as List<dynamic>?)
          ?.map((e) => CartProductOption.fromJson(e as Map<String, dynamic>))
          .toList(),
      qtyStep: json['qty_step'] as String?,
      minQty: json['min_qty'] as String?,
      maxQty: json['max_qty'] as String?,
      rewardPoints: json['reward_points'] as int?,
      priceInPoints: json['price_in_points'] as int?,
    );

Map<String, dynamic> _$CartProductToJson(CartProduct instance) =>
    <String, dynamic>{
      'company_id': instance.companyId,
      'company': instance.company,
      'product_id': instance.productId,
      'product': instance.product,
      'product_code': instance.productCode,
      'product_options': instance.productOptions,
      'amount': instance.qty,
      'min_qty': instance.minQty,
      'max_qty': instance.maxQty,
      'qty_step': instance.qtyStep,
      'item_id': instance.itemId,
      'is_update_allow': instance.isUpdateAllow,
      'image_path': instance.imagePath,
      'display_price': instance.displayPrice,
      'format_display_price': instance.formatDisplayPrice,
      'subtotal': instance.subtotal,
      'format_subtotal': instance.formatSubtotal,
      'price_in_points': instance.priceInPoints,
      'reward_points': instance.rewardPoints,
      'cartItemQtyChanged': instance.cartItemQtyChanged,
    };
