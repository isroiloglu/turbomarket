import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/SubCategoryScreen/bloc/subCategoryEvents.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/SubCategoryScreen/bloc/subCategoryRepository.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/SubCategoryScreen/bloc/subCategoryStates.dart';

class SubCategoryBloc extends Bloc<SubCategoryScreenEvent, SubCategoriesScreenState>{
  SubCategoriesRepositoryImp? repository;

  SubCategoryBloc({ this.repository}) : super(SubCategoriesInitialState()) {
    on<SubCategoryScreenEvent>(mapEventToState);
  }

  void mapEventToState(SubCategoryScreenEvent event,Emitter<SubCategoriesScreenState> emit) async {
    emit(SubCategoriesInitialState());
    if (event is FetchSubCategoriesEvent) {
      try {
        var subCategoryModel = await repository?.getSubCategory(
            event.id.toString());
        if ( subCategoryModel != null) {
          emit(SubCategoriesFetchState(subCategoryModel));
        } else {
          emit(SubCategoriesScreenErrorState(''));
        }
      } catch (error, stack) {
        print(stack.toString());
        emit(SubCategoriesScreenErrorState(error.toString()));
      }
    } else if (event is OnClickWishListLoaderEvent) {
      emit(OnClickWishListLoaderState(
          isReqToShowLoader: event.isReqToShowLoader));
    }
  }

}