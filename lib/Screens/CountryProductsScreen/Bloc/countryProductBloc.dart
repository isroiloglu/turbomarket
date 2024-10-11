import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/CountryProductsScreen/Bloc/CountryProductRepository.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/CountryProductsScreen/Bloc/CountryProductStates.dart';

import 'countryProductEvents.dart';

class CountryProductBloc
    extends Bloc<CountryProductScreenEvent, CountryProductScreenState> {
  CountryProductRepositoryImp repository;

  CountryProductBloc({required this.repository})
      : super(CountryProductInitialState()) {
    on<CountryProductScreenEvent>(mapEventToState);
  }

  void mapEventToState(CountryProductScreenEvent event,
      Emitter<CountryProductScreenState> emit) async {
    // emit(CountryProductInitialState());
    if (event is FetchCountryProductEvent) {
      log('WORKED HERE-CO MODELS');
      var model;
      try {
        model = await repository.getCountryProducts(event.id ?? "", event.page);
        if (model != null) {
          emit(CountryProductFetchState(model));
        } else {
          emit(CountryProductErrorState(''));
        }
      } catch (error, _) {
        print(error.toString());
        emit(CountryProductErrorState(error.toString()));
      }
    } else if (event is FetchPromotionProducts) {

      var model;
      try {
        model = await repository.getPromotionProducts(
            event.id ?? "", event.page ?? 1);
        if (model != null) {
          emit(CountryProductFetchState(model));
        } else {
          emit(CountryProductErrorState(''));
        }
      } catch (error, _) {
        print(_.toString());
        emit(CountryProductErrorState(error.toString()));
      }
    }
  }
}
