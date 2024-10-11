import 'package:equatable/equatable.dart';

import '../../../Models/CartModel/cart_model.dart';

abstract class CartScreenState {
  const CartScreenState();

  @override
  List<Object> get props => [];
}

class LoadingState extends CartScreenState{}

class CartScreenInitial extends CartScreenState {}

class CartScreenSuccess extends CartScreenState {
  const CartScreenSuccess(this.data);

  final CartModel data;

  @override
  List<Object> get props => [data];
}

class RemoveCartItemSuccess extends CartScreenState {
  const RemoveCartItemSuccess(this.data);

  final CartModel data;

  @override
  List<Object> get props => [data];
}

class RemoveCartSuccess extends CartScreenState {
  const RemoveCartSuccess(this.data);

  final CartModel data;

  @override
  List<Object> get props => [data];
}

class UpdateCartSuccess extends CartScreenState {
  const UpdateCartSuccess(this.data);

  final CartModel data;

  @override
  List<Object> get props => [data];
}

class ApplyVoucherSuccess extends CartScreenState {
  const ApplyVoucherSuccess(this.data);

  final CartModel data;

  @override
  List<Object> get props => [data];
}
class ApplyVoucherError extends CartScreenState {
  ApplyVoucherError(this._message);

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

// ignore: must_be_immutable
class CartScreenError extends CartScreenState {
  CartScreenError(this._message);

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

class QuantityEvent extends CartScreenState{
  const QuantityEvent(this.qty);
  final Map<String,String> qty;

  @override
  List<Object> get props => [qty];
}


class CartUpdateState extends CartScreenState{
  final CartModel data;
  const CartUpdateState(this.data);
}