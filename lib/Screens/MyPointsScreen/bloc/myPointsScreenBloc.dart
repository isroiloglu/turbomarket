import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/MyPointsScreen/bloc/myPointScreenEvents.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/MyPointsScreen/bloc/myPointScreenStates.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/MyPointsScreen/bloc/myPointsRepository.dart';

class MyPointScreenBloc extends Bloc<MyPointScreenEvent, MyPointScreenState>{
  MyPointsRepositoryImp? repositoryImp;

  MyPointScreenBloc({this.repositoryImp}):super(MyPointScreenInitialState()){
    on<MyPointScreenEvent>(mapEventToState);
  }

  void mapEventToState(MyPointScreenEvent event, Emitter<MyPointScreenState> emit) async {
    emit(MyPointScreenInitialState());
    switch (event.runtimeType) {
      case MyPointScreenFetchEvent:
        try {
          var model = await repositoryImp?.fetchPointsData();
          if (model != null) {
            emit(MyPointScreenSuccessState(model));
          } else {
            emit(MyPointsScreenErrorState(''));
          }
        } catch (error, _) {
          print(error.toString());
          emit(MyPointsScreenErrorState(error.toString()));
        }
        break;
    }
  }
}