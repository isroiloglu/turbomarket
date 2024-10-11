import 'package:flutter_bloc/flutter_bloc.dart';

import 'orderTrackingEvents.dart';
import 'orderTrackingRepository.dart';
import 'orderTrackingStates.dart';

class TrackOrderScreenBloc extends Bloc<TrackOrderScreenEvent, TrackOrderState>{
  TrackOrderScreenRepository? repository;

  TrackOrderScreenBloc({this.repository}): super(TrackOrderScreenInitial()){
    on<TrackOrderScreenEvent>(mapEventToState);
  }

  void mapEventToState(
      TrackOrderScreenEvent event,
      Emitter<TrackOrderState> emit,
      ) async {
    emit(TrackOrderScreenInitial());
    switch (event.runtimeType) {
      case TrackOrderScreenDataFetchEvent:
        print("blov event");
        emit(LoadingState());
        try {
          var model = await repository?.getTrackOrderData((event as TrackOrderScreenDataFetchEvent).orderId);
          if (model != null) {
            emit(TrackOrderScreenSuccess(model));
          } else {
            emit(TrackOrderScreenError(model?.msg??""));
          }
        } catch (error, _) {
          print(error.toString());
          emit(TrackOrderScreenError(error.toString()));
        }
        break;
      case LoadingEvent:
        emit(LoadingState());
        break;
      default:
        {}
    }
  }
}