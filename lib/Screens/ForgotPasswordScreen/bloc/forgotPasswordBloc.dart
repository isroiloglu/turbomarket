import 'package:flutter_bloc/flutter_bloc.dart';

import 'forgotPasswordEvents.dart';
import 'forgotPasswordRepository.dart';
import 'forgotPasswordStates.dart';

class ForgotPasswordBloc
    extends Bloc<ForgotPasswordEvent, ForgotPasswordStates> {
  ForgotPasswordRepositoryImp? forgotPasswordRepository;

  ForgotPasswordBloc({this.forgotPasswordRepository})
      : super(ForgotPasswordInitialState()) {
    on<ForgotPasswordEvent>(mapEventToState);
  }

  void mapEventToState(
    ForgotPasswordEvent event,
    Emitter<ForgotPasswordStates> emit,
  ) async {
    emit(ForgotPasswordLoadingState());
    if (event is ForgotPasswordSubmitEvent) {
      try {
        var model = await forgotPasswordRepository
            ?.forgotPassword(event.forgotPasswordRequest);
        if (model != null) {
          emit(ForgotPasswordSuccessState(model));
        } else {
          emit(ForgotPasswordErrorState(''));
        }
      } catch (error, stack) {
        print(stack.toString());
        emit(ForgotPasswordErrorState(error.toString()));
      }
    }
  }
}
