


import '../../../Models/CategoryProductData/category_product_data_model.dart';
import '../../../Models/SubcategoryModel/subcategory_model.dart';

abstract class SubCategoriesScreenState{} /*extends Equatable*/


class SubCategoriesInitialState extends SubCategoriesScreenState {
  @override
  // implement props
  List<Object> get props => [];
}


class OnClickWishListLoaderState extends SubCategoriesScreenState {
  final bool? isReqToShowLoader;

  OnClickWishListLoaderState({this.isReqToShowLoader});

  @override
  List<Object> get props => [isReqToShowLoader!];
}


class SubCategoriesFetchState extends SubCategoriesScreenState {

  SubCategoryModel? subCategoryModel;
  // CategoryProductsDataModel? subCategoryProductModel;
  SubCategoriesFetchState(this.subCategoryModel);


  @override
  // implement props
  List<Object> get props => [];
}

// ignore: must_be_immutable
class SubCategoriesScreenErrorState extends SubCategoriesScreenState {
  SubCategoriesScreenErrorState(this._message);

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

class SubCategoriesEmptyState extends SubCategoriesScreenState{

}
