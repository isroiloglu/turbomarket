import 'package:equatable/equatable.dart';

abstract class CMSScreenEvent extends Equatable {
  const CMSScreenEvent();


  @override
  List<Object> get props => [];
}

class CMSScreenDataFetchEvent extends CMSScreenEvent {
  final String pageId;
  const CMSScreenDataFetchEvent(this.pageId);
}