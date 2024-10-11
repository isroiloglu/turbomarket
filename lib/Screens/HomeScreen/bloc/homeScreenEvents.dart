
import 'package:equatable/equatable.dart';

abstract class HomeScreenEvent extends Equatable {
  const HomeScreenEvent();

  @override
  List<Object> get props => [];
}

class HomeScreenDataFetchEvent extends HomeScreenEvent {
  const HomeScreenDataFetchEvent();


  @override
  List<Object> get props => [];
}
