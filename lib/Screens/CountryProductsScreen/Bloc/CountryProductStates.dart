import 'package:equatable/equatable.dart';

import '../../../Models/CategoryProductData/category_product_data_model.dart';

abstract class CountryProductScreenState extends Equatable {}

class CountryProductInitialState extends CountryProductScreenState {
  @override
  List<Object?> get props => [];
}

class CountryProductFetchState extends CountryProductScreenState {
  CategoryProductsDataModel? categoriesModel;

  CountryProductFetchState(this.categoriesModel);

  @override
  // TODO: implement props
  List<Object?> get props => [categoriesModel];
}

class CountryProductErrorState extends CountryProductScreenState {
  CountryProductErrorState(this._message);

  String? _message;

  // ignore: unnecessary_getters_setters
  String? get message => _message;

  // ignore: unnecessary_getters_setters
  set message(String? message) {
    _message = message;
  }

  @override
  List<Object> get props => [message ?? ''];
}
