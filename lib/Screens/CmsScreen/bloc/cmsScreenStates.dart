import 'package:equatable/equatable.dart';

import '../../../Models/ProductDetailModels/response/cms_page_detail.dart';

abstract class CMSScreenState extends Equatable {
  const CMSScreenState();

  @override
  List<Object> get props => [];
}

class CMSScreenInitial extends CMSScreenState {}

class CMSScreenSuccess extends CMSScreenState {
  const CMSScreenSuccess(this.cmsPageDetail);

  final CMSPageDetail cmsPageDetail;

  @override
  List<Object> get props => [cmsPageDetail];
}

// ignore: must_be_immutable
class CMSScreenError extends CMSScreenState {
  CMSScreenError(this._message);

  String? _message;

  // ignore: unnecessary_getters_setters
  String? get message => _message;

  // ignore: unnecessary_getters_setters
  set message(String? message) {
    _message = message;
  }

  @override
  List<Object> get props => [];
}