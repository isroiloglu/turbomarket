import 'package:equatable/equatable.dart';

import '../../../Models/SearchModel/search_suggestion_model.dart';

abstract class SearchState{
  const SearchState();

  @override
  List<Object> get props => [];
}

class SearchInitialState extends SearchState{

}

class SearchScreenSuccess extends SearchState{
  SearchSuggestionModel? searchSuggestionModel;

  SearchScreenSuccess(this.searchSuggestionModel);

  @override
  List<Object> get props => [];
}



class SearchActionState extends SearchState{

}

class SearchEmptyState extends SearchState{

}


// ignore: must_be_immutable
class SearchScreenError extends SearchState {
  SearchScreenError(this._message);

  String? _message;

  // ignore: unnecessary_getters_setters
  String? get message => _message;

  // ignore: unnecessary_getters_setters
  set message(String? message) {
    _message = message;
  }

  @override
  List<Object> get props => [];
}

class UpdateSearchHistoryState extends SearchState{
  final List data;
  const UpdateSearchHistoryState(this.data);
}