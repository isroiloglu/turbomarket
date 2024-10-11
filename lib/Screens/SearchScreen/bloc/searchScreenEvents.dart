import 'package:equatable/equatable.dart';

abstract class SearchEvent{
  const SearchEvent();

  @override
  List<Object> get props => [];
}

class SearchSuggestionEvent extends SearchEvent{

  final String searchKey;


  const SearchSuggestionEvent(this.searchKey);

  @override
  List<Object> get props => [];
}

class UpdateSearchHistoryEvent extends SearchEvent{
 final  List data;
  const UpdateSearchHistoryEvent(this.data);
}
