
import 'package:flutter_bloc/flutter_bloc.dart';

import 'notificationScreenEvents.dart';
import 'notificationScreenRepository.dart';
import 'notificationScreenStates.dart';

class NotificationsScreenBloc extends Bloc<NotificationScreenEvent, NotificationsScreenState>{
  NotificationsScreenRepositoryImp? repository;

  NotificationsScreenBloc({this.repository}): super(NotificationsScreenInitial()){
    on<NotificationScreenEvent>(mapEventToState);
  }

  void mapEventToState(
      NotificationScreenEvent event, Emitter<NotificationsScreenState> emit) async {
    switch (event.runtimeType) {
      case NotificationScreenDataFetchEvent:
        NotificationsScreenInitial();
        try {
          var model = await repository?.getNotificationsPageData();
          if (model != null) {
            emit(NotificationsScreenSuccess(model));
          } else {
            emit(NotificationsScreenError(''));
          }
        } catch (error, _) {
          print(error.toString());
          emit(NotificationsScreenError(error.toString()));
        }
        break;

    }
  }
}