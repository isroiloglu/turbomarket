import 'package:flutter_bloc/flutter_bloc.dart';

import 'cmsScreenEvents.dart';
import 'cmsScreenRepository.dart';
import 'cmsScreenStates.dart';

class CMSScreenBloc extends Bloc<CMSScreenEvent, CMSScreenState>{
  CMSScreenRepositoryImp? repository;

  CMSScreenBloc({this.repository}): super(CMSScreenInitial()){
    on<CMSScreenEvent>(mapEventToState);
  }

  void mapEventToState(CMSScreenEvent event, Emitter<CMSScreenState> emit) async {
    emit(CMSScreenInitial());
    switch (event.runtimeType) {
      case CMSScreenDataFetchEvent:
        try {
          var model = await repository?.getMorePageData((event as CMSScreenDataFetchEvent).pageId);
          if (model != null) {
            emit(CMSScreenSuccess(model));
          } else {
            emit(CMSScreenError(''));
          }
        } catch (error, _) {
          print(error.toString());
          emit(CMSScreenError(error.toString()));
        }
        break;

    }
  }
}