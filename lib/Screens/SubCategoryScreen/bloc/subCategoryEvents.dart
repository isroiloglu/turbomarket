
import 'package:equatable/equatable.dart';

abstract class SubCategoryScreenEvent /*extends Equatable*/{}

class FetchSubCategoriesEvent extends SubCategoryScreenEvent {
  FetchSubCategoriesEvent(this.id);
  String? id;
  @override
  // implement props
  List<Object> get props => [id!];
}


class OnClickWishListLoaderEvent extends SubCategoryScreenEvent{
  final bool? isReqToShowLoader;
  OnClickWishListLoaderEvent({this.isReqToShowLoader});
  @override
  // implement props
  List<Object> get props => throw UnimplementedError();

}