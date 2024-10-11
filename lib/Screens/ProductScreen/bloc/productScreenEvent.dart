// part of 'product_screen_bloc';

import 'package:equatable/equatable.dart';

import '../../../Models/ProductDetailModels/request/add_to_cart_request.dart';

abstract class ProductScreenEvent extends Equatable {
  const ProductScreenEvent();


  @override
  List<Object> get props => [];
}

class ProductScreenDataFetchEvent extends ProductScreenEvent {
  final String productId;
  const ProductScreenDataFetchEvent(this.productId);
}

class ReviewsDataFetchEvent extends ProductScreenEvent{
  final int productId;
  const ReviewsDataFetchEvent(this.productId);
}

class AddToCartEvent extends ProductScreenEvent{
  final AddToCartRequest request;
  const AddToCartEvent(this.request);
}
class BuyNowEvent extends ProductScreenEvent{
  final AddToCartRequest request;
  const BuyNowEvent(this.request);
}

class AddToWishListEvent extends ProductScreenEvent{
  final AddToCartRequest request;
  const AddToWishListEvent(this.request);
}
class RemoveItemEvent extends ProductScreenEvent{
  final String itemId;


  const RemoveItemEvent(this.itemId);

  @override
  List<Object> get props => [];
}

class QuantityDecreaseEvent extends ProductScreenEvent{
  final int qty;
  const QuantityDecreaseEvent(this.qty);
}

class QuantityIncreaseEvent extends ProductScreenEvent{
  final int qty;
  const QuantityIncreaseEvent(this.qty);
}