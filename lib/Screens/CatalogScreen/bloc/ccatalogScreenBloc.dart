import 'package:flutter_bloc/flutter_bloc.dart';

import 'catalogScreenEvents.dart';
import 'catalogScreenRepository.dart';
import 'catalogScreenStates.dart';

class CatalogBloc extends Bloc<CatalogScreenEvent, CatalogScreenState> {
  CatalogRepository? repository;

  CatalogBloc({this.repository}) : super(CatalogInitialState()) {
    on<CatalogScreenEvent>(mapEventToState);
  }

  void mapEventToState(
      CatalogScreenEvent event, Emitter<CatalogScreenState> emit) async {
    emit(CatalogInitialState());
    if (event is FetchCatalogEvent) {
      var model = null;
      try {
        model = await repository?.getCatalogProductData(
            event.id ?? "",
            event.variantId ?? "",
            event.page ?? 1,
            event.sortBy ?? '',
            event.sortOrder ?? '',
            event.features_hash);
        if (model != null) {
          emit(CatalogFetchState(model));
        } else {
          emit(CatalogScreenErrorState(''));
        }
      } catch (error, _) {
        print(error.toString());
        emit(CatalogScreenErrorState(error.toString()));
      }
    } else if (event is FetchHomePageCatalogEvent) {
      try {
        var model = await repository?.getHomePageProductData(
            event.id.toString(),
            event.page ?? 1,
            event.sortBy ?? '',
            event.sortOrder ?? '',
            event.features_hash ?? '');
        if (model != null) {
          emit(CatalogFetchHomeProductState(model));
        } else {
          emit(CatalogScreenErrorState(''));
        }
      } catch (error, stack) {
        print(stack.toString());
        emit(CatalogScreenErrorState(error.toString()));
      }
    } else if (event is FetchFilterEvent) {
      try {
        var model = await repository?.getFilters(event.id ?? "");
        if (model != null) {
          emit(FilterFetchState(model));
        } else {
          emit(FilterScreenErrorState(''));
        }
      } catch (error, _) {
        print(error.toString());
        emit(FilterScreenErrorState(error.toString()));
      }
    } else if (event is OnClickWishListLoaderEvent) {
      emit(OnClickWishListLoaderState(
          isReqToShowLoader: event.isReqToShowLoader));
    }
  }
}
