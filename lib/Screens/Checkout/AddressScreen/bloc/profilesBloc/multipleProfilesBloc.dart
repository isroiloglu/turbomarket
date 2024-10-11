import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/Checkout/AddressScreen/bloc/profilesBloc/multipleProfilesEvent.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/Checkout/AddressScreen/bloc/profilesBloc/multipleProfilesRepository.dart';

import 'multipleProfilesState.dart';


class MultipleProfilesBloc extends Bloc<MultipleProfileEvents, MultipleProfileState>{
  MultipleProfilesRepositoryImp? repository;

  MultipleProfilesBloc({this.repository}) : super(MultipleProfileInitialState()) {
    on<MultipleProfileEvents>(mapEventToState);
  }

  void mapEventToState(
      MultipleProfileEvents event, Emitter<MultipleProfileState> emit) async {
    if (event is MultipleProfileFetchEvent) {
      // emit(MultipleProfileLoadingState());
      try {
        var model = await repository?.getMultipleUserProfileData();
        if (model != null) {
          emit(MultipleProfileSuccessState(model));
        } else {
          emit(const MultipleProfileErrorState(''));
        }
      } catch (error, stack) {
        print(stack.toString());
        emit(MultipleProfileErrorState(error.toString()));
      }
    }

    if (event is MultipleProfileAddProfileEvent) {
      // emit(MultipleProfileLoadingState());
      try {
        var model = await repository?.addProfile(event.request);
        if (model != null) {
          emit(MultipleProfileSaveSuccessState(model));
        } else {
          emit(const MultipleProfileErrorState(''));
        }
      } catch (error, stack) {
        print(stack.toString());
        emit(MultipleProfileErrorState(error.toString()));
      }
    }

    if (event is MultipleProfileUpdateProfileEvent) {
      // emit(MultipleProfileLoadingState());

      try {
        event.request.profileId="";
        var model = await repository?.updateProfile(event.request);
        if (model != null) {
          emit(MultipleProfileSaveSuccessState(model));
        } else {
          emit(const MultipleProfileErrorState(''));
        }
      } catch (error, stack) {
        print(stack.toString());
        emit(MultipleProfileErrorState(error.toString()));
      }
    }

    if (event is MultipleProfileReload) {
      // emit(MultipleProfileLoadingState());
      try {
        var model = await repository?.getMultipleUserProfileData();
        if (model != null) {
          emit(MultipleProfileReloadState(model));
        } else {
          emit(const MultipleProfileErrorState(''));
        }
      } catch (error, stack) {
        print(stack.toString());
        emit(MultipleProfileErrorState(error.toString()));
      }
    }
  }
}