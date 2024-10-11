import 'package:equatable/equatable.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/ShippingModel/Request/shippingAvailabilityRequest.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/shippingEstimateModel/request/shippingEstimateRequest.dart';

import '../../../Models/ShippingModel/Response/ShippingMethodsModel/shipping_method.dart';
import '../../../Models/shippingEstimateModel/request/submitShippingDetails.dart';

abstract class ShippingCostEstimationEvent extends Equatable{
  const ShippingCostEstimationEvent();
  @override
  List<Object> get props => [];
}


class ShippingCostEstimationFinalEvent extends ShippingCostEstimationEvent{
  final ShippingEstimateRequest request;
  const ShippingCostEstimationFinalEvent(this.request);
}

class ShippingCostEstimationCountryBasedEvent extends ShippingCostEstimationEvent{
  final ShippingMethodAvailabilityRequest request;
  const ShippingCostEstimationCountryBasedEvent(this.request);
}

class ShippingMethodSelectionEvent extends ShippingCostEstimationEvent{
  final shippingMethods selectedMethod;
  const ShippingMethodSelectionEvent(this.selectedMethod);
}

class SubmitShippingDetailsEvent extends ShippingCostEstimationEvent{
final SubmitShippingDetails shippingDetails;
const SubmitShippingDetailsEvent(this.shippingDetails);
}
