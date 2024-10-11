


import '../../../../Models/ShippingModel/Response/ShippingMethodsModel/shipping_method_model.dart';
import '../../../../Models/ShippingModel/checkout_billing_shipping_data.dart';

abstract class ShippingScreenState{}

class ShippingScreenInitialState extends ShippingScreenState{
  @override
  List<Object> get props => [];
}

class ShippingScreenFetchShippingMethodState extends ShippingScreenState{

  ShippingMethodModel shippingMethodModel;

  ShippingScreenFetchShippingMethodState(this.shippingMethodModel);

  @override
  List<Object> get props => [];
}

class ShippingScreenErrorState extends ShippingScreenState {
  ShippingScreenErrorState(this._message);

  String? _message;

  String? get message => _message;

  set message(String? message) {
    _message = message;
  }

  @override
  List<Object> get props => [];
}

class ShippingScreenEmptyScreen extends ShippingScreenState{

}