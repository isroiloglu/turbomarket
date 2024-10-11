

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/Checkout/ShippingScreen/bloc/shippingEvents.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/Checkout/ShippingScreen/bloc/shippingRepository.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/Checkout/ShippingScreen/bloc/shippingStates.dart';

class ShippingScreenBloc extends Bloc<ShippingScreenEvents,ShippingScreenState>{
  ShippingScreenRepository? repository;

  ShippingScreenBloc({ this.repository}) : super(ShippingScreenInitialState()) {
    on<ShippingScreenEvents>(mapEventToState);
  }

  void mapEventToState(ShippingScreenEvents event,Emitter<ShippingScreenState> emit) async {
    if(event is ShippingScreenFetchShippingMethodEvent){
      try {
        var model = await repository?.getShippingMethod(event.shippingMethodRequest!);
        if (model != null) {
          emit( ShippingScreenFetchShippingMethodState(model));
        } else {
          emit(ShippingScreenErrorState(''));
        }
      } catch (error, stacktrace) {
        print(stacktrace.toString());
        emit(ShippingScreenErrorState(error.toString()));
      }
    }
  }
}