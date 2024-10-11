// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'HomeScreenModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      id: json['id'] as int?,
      brand: json['brand'] as String?,
      name: json['name'] as String?,
      price: json['price'] as String?,
      imageLink: json['image_link'] as String?,
      description: json['description'] as String?,
      rating: (json['rating'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'brand': instance.brand,
      'name': instance.name,
      'price': instance.price,
      'image_link': instance.imageLink,
      'description': instance.description,
      'rating': instance.rating,
    };
