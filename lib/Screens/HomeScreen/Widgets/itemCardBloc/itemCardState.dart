import 'package:equatable/equatable.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/ProductDetailModels/response/add_to_cart_response_model.dart';
import '../../../../Models/WishlistModels/response/wishlisht_response_model.dart';
import '../../../../Models/baseResponse/base_response.dart';

abstract class ItemCardState extends Equatable {
  const ItemCardState();

  @override
  List<Object> get props => [];
}

class ItemCardAddToWishlistInitial extends ItemCardState {}

class ItemCardAddToWishlistLoading extends ItemCardState {}

class ItemCardAddToWishlistFinish extends ItemCardState {}

// ignore: must_be_immutable
class ItemCardAddToWishlistSuccess extends ItemCardState {
  ItemCardAddToWishlistSuccess(this.wishListResponseModel, this.productId);

  WishListResponseModel wishListResponseModel;
  String productId;

  @override
  List<Object> get props => [];
}

class AddToCartSuccess extends ItemCardState {
  const AddToCartSuccess(this.data);

  final AddToCartResponseModel data;

  @override
  List<Object> get props => [];
}

class RemoveItemSuccess extends ItemCardState {
  BaseResponse? baseModel;
  String? itemId;

  RemoveItemSuccess(this.baseModel, this.itemId);

  @override
  List<Object> get props => [];
}

// ignore: must_be_immutable
class ItemCardAddToWishlistError extends ItemCardState {
  ItemCardAddToWishlistError(this._message);

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
