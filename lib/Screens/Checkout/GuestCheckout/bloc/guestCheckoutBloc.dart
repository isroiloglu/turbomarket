import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/Checkout/GuestCheckout/bloc/guestCheckoutEvents.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/Checkout/GuestCheckout/bloc/guestCheckoutStates.dart';

import 'guestCheckoutRepository.dart';

class GuestCheckoutBloc extends Bloc<GuestCheckoutEvents, GuestCheckoutStates>{
  GuestCheckoutRepositoryImp? repository;

  GuestCheckoutBloc({this.repository}): super(GuestCheckoutInitialState()){
    on<GuestCheckoutEvents>(mapEventToState);
  }

  void mapEventToState(GuestCheckoutEvents event, Emitter<GuestCheckoutStates> emit) async {
    if(event is GuestCheckoutFetchEvent){
      emit(GuestCheckoutInitialState());
      try {
        var model = await repository?.getGuestProfileData();
        if (model != null) {
          emit(GuestCheckoutDataFetchState(model));
        } else {
          emit(GuestCheckoutErrorState(''));
        }
      } catch (error, _) {
        print(error.toString());
        emit(GuestCheckoutErrorState(error.toString()));
      }
    }


    if(event is GuestCheckoutSubmitEvent){
      emit(GuestCheckoutInitialState());
      try {
        var model = await repository?.submitGuestData(event.submitUserDataRequest);
        if (model != null) {
          emit(GuestCheckoutSubmitState(model));
        } else {
          emit(GuestCheckoutErrorState(''));
        }
      } catch (error, stack) {
        print(stack.toString());
        emit(GuestCheckoutErrorState(error.toString()));
      }
    }



    }
  }
