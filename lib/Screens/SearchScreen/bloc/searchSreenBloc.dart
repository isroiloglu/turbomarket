import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/SearchScreen/bloc/searchScreenEvents.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/SearchScreen/bloc/searchScreenRepository.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/SearchScreen/bloc/searchScreenStates.dart';

class SearchScreenBloc extends Bloc<SearchEvent, SearchState> {
  SearchRepository? repository;

  SearchScreenBloc({this.repository}) : super(SearchInitialState()) {
    on<SearchEvent>(mapEventToState);
  }

  @override
  void mapEventToState(SearchEvent event, Emitter<SearchState> emit) async {
    if (event is SearchSuggestionEvent) {
      try {
        var model = await repository?.getSearchSuggestion(event.searchKey);
        if (model != null) {
          emit(SearchScreenSuccess(model));
        } else {
          emit(SearchScreenError(''));
        }
      } catch (error, sT) {
        print(sT.toString());
        emit(SearchScreenError(error.toString()));
      }
    } else if (event is UpdateSearchHistoryEvent) {
      emit(UpdateSearchHistoryState(event.data));
    }
  }
}
