


import '../../../../Models/ShippingModel/Request/shipping_method_request.dart';
import '../../../../Models/ShippingModel/checkout_billing_shipping_data.dart';

abstract class ShippingScreenEvents{}

class ShippingScreenFetchShippingMethodEvent extends ShippingScreenEvents{
  ShippingMethodRequest? shippingMethodRequest;
  ShippingScreenFetchShippingMethodEvent(this.shippingMethodRequest );

  @override
  // implement props
  List<Object> get props => [];

}
