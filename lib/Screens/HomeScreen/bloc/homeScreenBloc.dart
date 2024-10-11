import 'package:flutter_bloc/flutter_bloc.dart';

import 'homeScreenEvents.dart';
import 'homeScreenRepository.dart';
import 'homeScreenStates.dart';

class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  HomeScreenRepository repository;

  HomeScreenBloc({required this.repository}) : super(HomeScreenInitialState()) {
    on<HomeScreenEvent>(mapEventToState);
  }

  void mapEventToState(
      HomeScreenEvent event, Emitter<HomeScreenState> emit) async {
    if (event is HomeScreenDataFetchEvent) {
      emit(HomeScreenLoadingState());
      try {
        var model = await repository?.getHomeData();
        if (model != null) {
        //  storageController.setCompanyId(model.companyId ?? '');
          emit( HomeScreenSuccessState(model));
        } else {
          emit(HomeScreenErrorState(''));
        }
      } catch (error, stack) {
        print(stack.toString());
        emit(HomeScreenErrorState(error.toString()));
      }
    }
  }
}