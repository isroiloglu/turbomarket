import 'package:equatable/equatable.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/CartScreen/shippingCostEstimationBloc/shippingCostEstimationEvents.dart';

import '../../../Models/CartModel/Request/apply_coupon.dart';
import '../../../Models/CartModel/Request/cart_request.dart';
import '../../../Models/CartModel/Request/remove_cart_item_request.dart';
import '../../../Models/CartModel/Request/remove_cart_request.dart';
import '../../../Models/CartModel/Request/update_cart_request.dart';

abstract class CartScreenEvent extends Equatable {
  const CartScreenEvent();

  @override
  List<Object> get props => [];
}

class CartScreenDataFetchEvent extends CartScreenEvent {
  const CartScreenDataFetchEvent(this.request);
  final CartRequest request;

  @override
  List<Object> get props => [request];
}

class CartScreenRemoveItemEvent extends CartScreenEvent {
  const CartScreenRemoveItemEvent(this.request);

  final RemoveCartItemRequest request;

  @override
  List<Object> get props => [request];
}

class CartScreenRemoveEvent extends CartScreenEvent {
  const CartScreenRemoveEvent(this.request);

  final RemoveCartRequest request;

  @override
  List<Object> get props => [request];
}

class CartScreenUpdateQtyEvent extends CartScreenEvent {
  const CartScreenUpdateQtyEvent(this.values, this.customerId);

  final UpdateCartRequest values;
  final String? customerId;

  @override
  List<Object> get props => [values];
}

class ManageVoucherEvent extends CartScreenEvent {
  const ManageVoucherEvent(this.applyCoupon,this.voucher);

  final ApplyCoupon applyCoupon;
  final String voucher;

  @override
  List<Object> get props => [applyCoupon, voucher];
}

class RemoveVoucherEvent extends CartScreenEvent {
  const RemoveVoucherEvent(this.values, this.customerId);

  final UpdateCartRequest values;
  final String? customerId;

  @override
  List<Object> get props => [values];
}
class CartQuantityDecreaseEvent extends CartScreenEvent{
  final Map<String,String> qty;
  const CartQuantityDecreaseEvent(this.qty);
}

class CartQuantityIncreaseEvent extends CartScreenEvent{
  final Map<String,String> qty;
  const CartQuantityIncreaseEvent(this.qty);
}

class ReloadCartEvent extends CartScreenEvent{
  final UpdateCartRequest value;
  final String? customerId;
  const ReloadCartEvent(this.value, this.customerId);
}


class ApplyRewardPointEvent extends CartScreenEvent{
  final CartRequest request;
  const ApplyRewardPointEvent(this.request);
}

class RemovePointEvent extends CartScreenEvent{
  final CartRequest request;

  const RemovePointEvent(this.request,);
}