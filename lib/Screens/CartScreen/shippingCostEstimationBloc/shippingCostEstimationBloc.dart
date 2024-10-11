import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/CartScreen/shippingCostEstimationBloc/shippingCostEstimationEvents.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/CartScreen/shippingCostEstimationBloc/shippingCostEstimationRepository.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/CartScreen/shippingCostEstimationBloc/shippingCostEstimationStates.dart';

class ShippingCostEstimationScreenBloc
    extends Bloc<ShippingCostEstimationEvent, ShippingCostEstimationState> {
  ShippingCostEstimationRepositoryImp? repository;

  ShippingCostEstimationScreenBloc({this.repository})
      : super(ShippingCostEstimationInitialState()) {
    on<ShippingCostEstimationEvent>(mapEventToState);
  }

  void mapEventToState(ShippingCostEstimationEvent event,
      Emitter<ShippingCostEstimationState> emit) async {
    if (event is ShippingCostEstimationFinalEvent) {
      emit(ShippingCostEstimationLoadingState());
      try {
        var model = await repository?.getEstimateShippingCost(event.request);
        if (model != null) {
          emit(ShippingCostEstimationSuccessState(model));
        } else {
          emit(const ShippingCostEstimationErrorState(''));
        }
      } catch (error) {
        emit(ShippingCostEstimationErrorState(error.toString()));
      }
    } else if (event is ShippingCostEstimationCountryBasedEvent) {
      emit(ShippingCostEstimationLoadingState());
      try {
        var model = await repository
            ?.getEstimateShippingMethodsBasedOnCountry(event.request);
        if (model != null) {
          emit(ShippingCostEstimationCountryBasedSuccessState(model));
        } else {
          emit(const ShippingCostEstimationErrorState(''));
        }
      } catch (error, err) {
        print(err);
        emit(ShippingCostEstimationErrorState(error.toString()));
      }
    } else if (event is ShippingMethodSelectionEvent) {
      emit(ShippingCostEstimationLoadingState());
      emit(ShippingMethodSelectionState(event.selectedMethod));
    } else if (event is SubmitShippingDetailsEvent) {
      emit(ShippingCostEstimationLoadingState());

      try {
        var model = await repository
            ?.submitShippingMethodDetails(event.shippingDetails);
        if (model != null) {
          emit(ShippingMethodDetailsSuccessState(model));
        } else {
          emit(const ShippingCostEstimationErrorState(''));
        }
      } catch (error, err) {
        print(err);
        emit(ShippingCostEstimationErrorState(error.toString()));
      }
    }
  }
}
