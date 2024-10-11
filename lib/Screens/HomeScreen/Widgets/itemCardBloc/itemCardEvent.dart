import 'package:equatable/equatable.dart';
import '../../../../Models/ProductDetailModels/request/add_to_cart_request.dart';

abstract class ItemCardEvent extends Equatable {
  const ItemCardEvent();

  @override
  List<Object> get props => [];
}

class AddToWishListItemCardEvent extends ItemCardEvent {
  final AddToCartRequest request;
  final String productId;

  const AddToWishListItemCardEvent(this.request, this.productId);

  @override
  List<Object> get props => [request];
}

class AddToCartEvent extends ItemCardEvent {
  final AddToCartRequest request;

  const AddToCartEvent(this.request);
}

class RemoveItemEvent extends ItemCardEvent {
  final String itemId;

  const RemoveItemEvent(this.itemId);

  @override
  List<Object> get props => [];
}
