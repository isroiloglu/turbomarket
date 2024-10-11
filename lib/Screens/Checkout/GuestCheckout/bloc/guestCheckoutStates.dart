import 'package:equatable/equatable.dart';

import '../../../../Models/CheckoutModels/GuestCheckout/Response/guestProfileData.dart';
import '../../../../Models/ShippingModel/Response/ShippingMethodsModel/shipping_method_model.dart';
import '../../../../Models/baseResponse/base_response.dart';

abstract class GuestCheckoutStates extends Equatable{

}

class GuestCheckoutInitialState extends GuestCheckoutStates{
  @override
  List<Object?> get props => [];
}

class GuestCheckoutDataFetchState extends GuestCheckoutStates{

  GuestProfileData? guestProfileData;
  GuestCheckoutDataFetchState(this.guestProfileData);

  @override
  List<Object?> get props => [];

}

class GuestCheckoutReloadState extends GuestCheckoutStates{

  GuestProfileData? guestProfileData;
  GuestCheckoutReloadState(this.guestProfileData);

  @override
  List<Object?> get props => [];

}

class GuestCheckoutSubmitState extends GuestCheckoutStates{
  ShippingMethodModel? baseResponse;
  GuestCheckoutSubmitState(this.baseResponse);

  @override
  List<Object?> get props => [];

}

class GuestCheckoutEmptyState extends GuestCheckoutStates{
  @override
  List<Object?> get props => [];

}

class GuestCheckoutErrorState extends GuestCheckoutStates {
  GuestCheckoutErrorState(this._message);

  String? _message;

  String? get message => _message;

  set message(String? message) {
    _message = message;
  }

  @override
  List<Object> get props => [];
}

