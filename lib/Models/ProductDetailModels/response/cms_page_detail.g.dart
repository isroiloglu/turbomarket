// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cms_page_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CMSPageDetail _$CMSPageDetailFromJson(Map<String, dynamic> json) =>
    CMSPageDetail(
      pageId: json['page_id'] as String?,
      companyId: json['company_id'] as String?,
      parentId: json['parent_id'] as String?,
      idPath: json['id_path'] as String?,
      status: json['status'] as String?,
      pageType: json['page_type'] as String?,
      position: json['position'] as String?,
      timestamp: json['timestamp'] as String?,
      usergroupIds: json['usergroup_ids'] as String?,
      localization: json['localization'] as String?,
      newWindow: json['new_window'] as String?,
      useAvailPeriod: json['use_avail_period'] as String?,
      langCode: json['lang_code'] as String?,
      page: json['page'] as String?,
      description: json['description'] as String?,
      metaKeywords: json['meta_keywords'] as String?,
      metaDescription: json['meta_description'] as String?,
      pageTitle: json['page_title'] as String?,
      availFromTimestamp: json['avail_from_timestamp'] as String?,
      availTillTimestamp: json['avail_till_timestamp'] as String?,
      link: json['link'] as String?,
      facebookObjType: json['facebook_obj_type'] as String?,
    );

Map<String, dynamic> _$CMSPageDetailToJson(CMSPageDetail instance) =>
    <String, dynamic>{
      'page_id': instance.pageId,
      'company_id': instance.companyId,
      'parent_id': instance.parentId,
      'id_path': instance.idPath,
      'status': instance.status,
      'page_type': instance.pageType,
      'position': instance.position,
      'timestamp': instance.timestamp,
      'usergroup_ids': instance.usergroupIds,
      'localization': instance.localization,
      'new_window': instance.newWindow,
      'use_avail_period': instance.useAvailPeriod,
      'avail_from_timestamp': instance.availFromTimestamp,
      'avail_till_timestamp': instance.availTillTimestamp,
      'facebook_obj_type': instance.facebookObjType,
      'lang_code': instance.langCode,
      'page': instance.page,
      'description': instance.description,
      'meta_keywords': instance.metaKeywords,
      'meta_description': instance.metaDescription,
      'page_title': instance.pageTitle,
      'link': instance.link,
    };
