import 'package:flutter_bloc/flutter_bloc.dart';

import 'addReviewScreenEvent.dart';
import 'addReviewScreenRepository.dart';
import 'addReviewScreenState.dart';


class AddReviewScreenBloc extends Bloc<AddReviewEvent, AddReviewScreenState>{
  AddReviewRepositoryImp? repository;

  AddReviewScreenBloc({this.repository}) : super(AddReviewInitialState()) {
    on<AddReviewEvent>(mapEventToState);
  }

  void mapEventToState(
      AddReviewEvent event, Emitter<AddReviewScreenState> emit) async {
    if (event is AddReviewSaveEvent) {
      emit(AddReviewLoadingState());
      try {
        var model = await repository?.addReview(event.reviewRequest, event.productId);
        if (model != null) {
          emit(AddReviewSuccessState(model));
        } else {
          emit(const AddReviewErrorState(''));
        }
      } catch (error, stack) {
        print(stack.toString());
        emit(AddReviewErrorState(error.toString()));
      }
    }
  }
}