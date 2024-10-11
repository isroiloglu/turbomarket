import 'package:equatable/equatable.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/CheckoutModels/GuestCheckout/Request/submitDataRequest.dart';

abstract class GuestCheckoutEvents extends Equatable{

}

class GuestCheckoutFetchEvent extends GuestCheckoutEvents{
  @override
  List<Object?> get props => [];

}

class GuestCheckoutReloadEvent extends GuestCheckoutEvents{
  @override
  List<Object?> get props => [];
}

class GuestCheckoutSubmitEvent extends GuestCheckoutEvents{
  SubmitUserDataRequest? submitUserDataRequest;
  GuestCheckoutSubmitEvent(this.submitUserDataRequest);

  @override
  List<Object?> get props => [];
}