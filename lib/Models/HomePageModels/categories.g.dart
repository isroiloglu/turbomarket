// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categories.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Categories _$CategoriesFromJson(Map<String, dynamic> json) => Categories(
      json['category_id'] as String?,
      json['parent_id'] as String?,
      json['category'] as String?,
      json['position'] as String?,
      json['status'] as String?,
      json['company_id'] as String?,
      json['has_children'] as String?,
      (json['subcategories'] as List<dynamic>?)
          ?.map((e) => Categories.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['images'] as String?,
      json['thumbnail'] as String?,
      json['icon_images'] as String?,
    );

Map<String, dynamic> _$CategoriesToJson(Categories instance) =>
    <String, dynamic>{
      'category_id': instance.categoryId,
      'parent_id': instance.parentId,
      'category': instance.category,
      'position': instance.position,
      'status': instance.status,
      'company_id': instance.companyId,
      'has_children': instance.hasChildren,
      'subcategories': instance.subcategoryList,
      'images': instance.images,
      'thumbnail': instance.thumbnail,
      'icon_images': instance.iconImages,
    };
