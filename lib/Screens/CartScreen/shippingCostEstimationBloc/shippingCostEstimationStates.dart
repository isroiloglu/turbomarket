import 'package:equatable/equatable.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/ShippingModel/Response/ShippingMethodsModel/shipping_method.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/baseResponse/base_response.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/shippingEstimateModel/response/shippingEstimateResponse.dart';

import '../../../Models/ShippingModel/Response/ShippingMethodsModel/shipping_method_model.dart';


abstract class ShippingCostEstimationState extends Equatable {
  const ShippingCostEstimationState();

  @override
  List<Object> get props => [];
}

class ShippingCostEstimationInitialState extends ShippingCostEstimationState{}

class ShippingCostEstimationLoadingState extends ShippingCostEstimationState{}
class ShippingCostEstimationCompleteState extends ShippingCostEstimationState{}

class ShippingCostEstimationSuccessState extends ShippingCostEstimationState{
  final ShippingEstimateResponse data;
  const ShippingCostEstimationSuccessState(this.data);
}

class ShippingCostEstimationCountryBasedSuccessState extends ShippingCostEstimationState{
  final ShippingMethodModel data;
  const ShippingCostEstimationCountryBasedSuccessState(this.data);
}


class ShippingCostEstimationErrorState extends ShippingCostEstimationState{
  final String message;
  const ShippingCostEstimationErrorState(this.message);
}

class EmptyState extends ShippingCostEstimationState{
  @override
  List<Object> get props => [];
}

class ShippingMethodSelectionState extends ShippingCostEstimationState{
  final shippingMethods selectedMethod;

  const ShippingMethodSelectionState(this.selectedMethod);
}


class ShippingMethodDetailsSuccessState extends ShippingCostEstimationState{
  final BaseResponse data;
  const ShippingMethodDetailsSuccessState(this.data);
}


