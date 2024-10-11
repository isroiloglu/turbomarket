import 'package:flutter_bloc/flutter_bloc.dart';

import 'categoryScreenEvents.dart';
import 'categoryScreenRepository.dart';
import 'categoryScreenStates.dart';

class CategoryScreenBloc extends Bloc<CategoryScreenEvent,CategoryScreenState>{
  CategoriesScreenRepository repository;

  CategoryScreenBloc({ required this.repository}) : super(CategoriesInitialState()) {
    on<CategoryScreenEvent>(mapEventToState);
  }

  void mapEventToState(CategoryScreenEvent event,Emitter<CategoryScreenState> emit) async {
    emit(CategoriesInitialState());
    if (event is FetchCategoriesEvent) {
      try {
        var model = await repository?.getCategoryProductData(event.id.toString(),"","","","");
        var subCategoryModel = await repository?.getSubCategory(event.id.toString());
        if (model != null && subCategoryModel!=null ) {
          emit( CategoriesFetchState(model,subCategoryModel));
        } else {
          emit(CategoriesScreenErrorState(''));
        }
      } catch (error, stack) {
        print(stack.toString());
        emit(CategoriesScreenErrorState(error.toString()));
      }
    }else if(event is OnClickWishListLoaderEvent){
      emit( OnClickWishListLoaderState(isReqToShowLoader: event.isReqToShowLoader));
    }
  }
}