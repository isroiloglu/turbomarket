abstract class CatalogScreenEvent /*extends Equatable*/ {}

class FetchCatalogEvent extends CatalogScreenEvent {
  FetchCatalogEvent(this.id, this.variantId, this.page, this.sortBy,
      this.sortOrder, this.features_hash);

  String? id;
  String? variantId;
  int? page;
  String? sortBy;
  String? sortOrder;
  String? features_hash;

  @override
  List<Object> get props => [];
}

class FetchHomePageCatalogEvent extends CatalogScreenEvent {
  FetchHomePageCatalogEvent(
      this.id, this.page, this.sortBy, this.sortOrder, this.features_hash);

  String? id;
  int? page;
  String? sortBy;
  String? sortOrder;
  String? features_hash;

  @override
  List<Object> get props => [];
}

class FetchFilterEvent extends CatalogScreenEvent {
  FetchFilterEvent(this.id);

  String? id;

  @override
  List<Object> get props => [];
}

class OnClickWishListLoaderEvent extends CatalogScreenEvent {
  final bool? isReqToShowLoader;

  OnClickWishListLoaderEvent({this.isReqToShowLoader});

  @override
  List<Object> get props => [];
}
