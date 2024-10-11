import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/PromotionScreen/bloc/promotionScreenEvents.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/PromotionScreen/bloc/promotionScreenRepository.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/PromotionScreen/bloc/promotionScreenState.dart';

class PromotionScreenBloc extends Bloc<PromotionScreenEvent, PromotionScreenState>{
  PromotionScreenRepositoryImp? repositoryImp;

  PromotionScreenBloc({this.repositoryImp}):super(PromotionScreenInitialState()){
    on<PromotionScreenEvent>(mapEventToState);
  }

  void mapEventToState(PromotionScreenEvent event, Emitter<PromotionScreenState> emit) async {
    emit(PromotionScreenInitialState());
    if(event is PromotionScreenFetchEvent){
      try {
        var model = await repositoryImp?.fetchPromotionList(event.pageNumber);
        if (model != null) {
          emit(PromotionScreenSuccessState(model));
        } else {
          emit(PromotionScreenErrorState(''));
        }
      } catch (error, stack) {
        print(stack.toString());
        emit(PromotionScreenErrorState(error.toString()));
      }
    }


  }
}