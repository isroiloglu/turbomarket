import 'package:flutter_bloc/flutter_bloc.dart';

import 'accountScreenEvents.dart';
import 'accountScreenRepository.dart';
import 'accountScreenStates.dart';

class AccountScreenBloc extends Bloc<AccountScreenEvents, AccountScreenState> {
  AccountScreenRepository? repository;

  AccountScreenBloc({this.repository}) : super(AccountScreenInitialState()) {
    on<AccountScreenEvents>(mapEventToState);
  }

  void mapEventToState(
      AccountScreenEvents event, Emitter<AccountScreenState> emit) async {
    emit(AccountScreenInitialState());
    if (event is AccountScreenFetchEvent) {
      try {
        var model = await repository?.getAccountDetails();
        if (model != null) {
          emit(AccountScreenSuccessState(model));
        } else {
          emit(AccountScreenErrorState(''));
        }
      } catch (error, stack) {
        print(stack.toString());
        emit(AccountScreenErrorState(error.toString()));
      }
    }

    if (event is AccountScreenReloadEvent) {
      try {
        var model = await repository?.getAccountDetails();
        if (model != null) {
          emit(AccountScreenReloadState(model));
        } else {
          emit(AccountScreenErrorState(''));
        }
      } catch (error, stack) {
        print(stack.toString());
        emit(AccountScreenErrorState(error.toString()));
      }
    }

    if (event is AccountScreenDeleteProfileEvent) {
      try {
        var model = await repository?.deleteProfile(event.profileId);
        if (model != null) {
          emit(AccountScreenProfileSuccessState(model));
        } else {
          emit(AccountScreenErrorState(''));
        }
      } catch (error, stack) {
        print(stack.toString());
        emit(AccountScreenErrorState(error.toString()));
      }
    }

    if (event is AccountScreenAddProfileEvent) {
      try {
        var model = await repository?.createNewProfile(event.request);
        if (model != null) {
          emit(AccountScreenProfileSuccessState(model));
        } else {
          emit(AccountScreenErrorState(''));
        }
      } catch (error, stack) {
        print(stack.toString());
        emit(AccountScreenErrorState(error.toString()));
      }
    }

    if (event is AccountScreenUpdateProfile) {
      try {
        var model = await repository?.updateProfile(
            event.profileId, event.updateProfileRequest);
        if (model != null) {
          emit(AccountScreenProfileSuccessState(model));
        } else {
          emit(AccountScreenErrorState(''));
        }
      } catch (error, stack) {
        print(stack.toString());
        emit(AccountScreenErrorState(error.toString()));
      }
    }
    if(event is AccountLoginEvent){
      try {
        var model = await repository?.login(
            event.userId, event.userPassword);
        if (model != null) {
          emit(AccountLoginState(model));
        } else {
          emit(AccountScreenErrorState(''));
        }
      } catch (error, stack) {
        print(stack.toString());
        emit(AccountScreenErrorState(error.toString()));
      }
    }
    if(event is AccountDeleteEvent){
      try {
        var model = await repository?.deleteCustomer((event).customerId);
        if (model != null) {
          emit(DeleteAccountSuccess(model));
        } else {
          emit(AccountScreenErrorState(model?.message??""));
        }
      } catch (error, _) {
        print(error.toString());
        emit(AccountScreenErrorState(error.toString()));
      }
    }
  }
}
