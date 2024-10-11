import 'package:equatable/equatable.dart';

import '../../../Models/ProductDetailModels/response/add_to_cart_response_model.dart';
import '../../../Models/ProductDetailModels/response/product_detail_model.dart';
import '../../../Models/WishlistModels/response/wishlisht_response_model.dart';
import '../../../Models/baseResponse/base_response.dart';

abstract class ProductScreenState extends Equatable {
  const ProductScreenState();

  @override
  List<Object> get props => [];
}

class ProductEmptyState extends ProductScreenState {}

class ProductCompleteState extends ProductScreenState {}

class ProductScreenInitial extends ProductScreenState {}

class AddToCartComplete extends ProductScreenState {}

class ProductScreenSuccess extends ProductScreenState {
  const ProductScreenSuccess(this.productPageData);

  final ProductDetailModel productPageData;

  @override
  List<Object> get props => [productPageData];
}

class AddToCartSuccess extends ProductScreenState {
  const AddToCartSuccess(this.data);

  final AddToCartResponseModel data;

  @override
  List<Object> get props => [];
}

class BuyNowSuccess extends ProductScreenState {
  const BuyNowSuccess(this.data);

  final AddToCartResponseModel data;

  @override
  List<Object> get props => [];
}

class AddToWishListSuccess extends ProductScreenState {
  const AddToWishListSuccess(this.data);

  final WishListResponseModel data;

  @override
  List<Object> get props => [data];
}

class RemoveItemSuccess extends ProductScreenState {
  BaseResponse? baseModel;

  RemoveItemSuccess(this.baseModel);

  @override
  List<Object> get props => [];
}

class QuantityEvent extends ProductScreenState {
  QuantityEvent(this.qty);

  int qty;

  @override
  List<Object> get props => [];
}

// ignore: must_be_immutable
class ProductScreenError extends ProductScreenState {
  ProductScreenError(this._message);

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
