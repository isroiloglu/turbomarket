import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/StoreSelection/bloc/storeSelectionScreenEvents.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/StoreSelection/bloc/storeSelectionScreenRepository.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/StoreSelection/bloc/storeSelectionScreenStates.dart';

class StoreSelectionScreenBloc extends Bloc<StoreSelectionScreenEvents, StoreSelectionScreenStates>{
  StoreSelectionRepositoryImp repositoryImp;

  StoreSelectionScreenBloc({required this.repositoryImp}):super(StoreSelectionScreenInitialState()){
    on<StoreSelectionScreenEvents>(mapEventToState);
  }

  void mapEventToState(StoreSelectionScreenEvents event, Emitter<StoreSelectionScreenStates> emit) async {
    emit(StoreSelectionScreenInitialState());
    switch (event.runtimeType) {
      case StoreSelectionScreenFetchEvent:
        try {
          var model = await repositoryImp?.getStoreFrontsData();
          if (model != null) {
            emit(StoreSelectionScreenSuccessState(model));
          } else {
            emit(StoreSelectionScreenErrorState(''));
          }
        } catch (error, _) {
          print(error.toString());
          emit(StoreSelectionScreenErrorState(error.toString()));
        }
        break;

      case StoreSelectionLoadingEvent:
        emit(StoreSelectionScreenInitialState());
        try{
          var data=(event as StoreSelectionLoadingEvent).selectedStoreFront;
          emit(StoreSelectionCompleteState(data));
        }catch(error,_){
          print(error.toString());
          emit(StoreSelectionScreenErrorState(error.toString()));
        }
        break;

    }
  }
}