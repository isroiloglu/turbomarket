import 'package:equatable/equatable.dart';

import '../../../Models/CategoryProductData/category_product_data_model.dart';
import '../../../Models/HomePageModels/product_filters.dart';

abstract class CatalogScreenState extends Equatable {}

class CatalogInitialState extends CatalogScreenState {
  @override
  List<Object> get props => [];
}

class OnClickWishListLoaderState extends CatalogScreenState {
  final bool? isReqToShowLoader;

  OnClickWishListLoaderState({this.isReqToShowLoader});

  @override
  List<Object> get props => [isReqToShowLoader!];
}

class CatalogFetchState extends CatalogScreenState {
  CategoryProductsDataModel? categoriesModel;

  CatalogFetchState(this.categoriesModel);

  @override
  List<Object> get props => [categoriesModel ?? []];
}

class CatalogFetchHomeProductState extends CatalogScreenState {
  CategoryProductsDataModel? categoriesModel;

  CatalogFetchHomeProductState(this.categoriesModel);

  @override
  List<Object> get props => [categoriesModel ?? []];
}

class FilterInitialState extends CatalogScreenState {
  @override
  List<Object> get props => [];
}

class FilterFetchState extends CatalogScreenState {
  ProductFiltersModel? productFilters;

  FilterFetchState(this.productFilters);

  @override
  List<Object> get props => [productFilters ?? []];
}

class IdleState extends CatalogScreenState {
  IdleState();

  @override
  List<Object> get props => [];
}

// ignore: must_be_immutable
class CatalogScreenErrorState extends CatalogScreenState {
  CatalogScreenErrorState(this._message);

  String? _message;

  String? get message => _message;

  set message(String? message) {
    _message = message;
  }

  @override
  List<Object> get props => [];
}

// ignore: must_be_immutable
class FilterScreenErrorState extends CatalogScreenState {
  FilterScreenErrorState(this._message);

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
