

abstract class CategoryScreenEvent /*extends Equatable*/{}

class FetchCategoriesEvent extends CategoryScreenEvent {
  FetchCategoriesEvent(this.id,);
  String? id;
  @override
  // implement props
  List<Object> get props => [];
}


class OnClickWishListLoaderEvent extends CategoryScreenEvent{
  final bool? isReqToShowLoader;
  OnClickWishListLoaderEvent({this.isReqToShowLoader});
  @override
  // implement props
  List<Object> get props => throw UnimplementedError();

}