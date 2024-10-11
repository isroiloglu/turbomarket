


import '../../../Models/CategoryProductData/category_product_data_model.dart';
import '../../../Models/SubcategoryModel/subcategory_model.dart';

abstract class CategoryScreenState /*extends Equatable*/ {}


class CategoriesInitialState extends CategoryScreenState {
  @override
  // implement props
  List<Object> get props => [];
}


class OnClickWishListLoaderState extends CategoryScreenState {
  final bool? isReqToShowLoader;

  OnClickWishListLoaderState({this.isReqToShowLoader});

  @override
  List<Object> get props => [isReqToShowLoader!];
}


class CategoriesFetchState extends CategoryScreenState {

  CategoryProductsDataModel? categoriesModel;
  SubCategoryModel? subCategoryModel;

  CategoriesFetchState(this.categoriesModel,this.subCategoryModel);

  @override
  // implement props
  List<Object> get props => [];
}

// ignore: must_be_immutable
class CategoriesScreenErrorState extends CategoryScreenState {
  CategoriesScreenErrorState(this._message);

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

class CcategoriesScreenEmptyState extends CategoryScreenState{

}