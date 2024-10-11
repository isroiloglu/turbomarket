import 'package:equatable/equatable.dart';

import '../../../Models/HomePageModels/home_screen_models.dart';

abstract class HomeScreenState extends Equatable {
  const HomeScreenState();

  @override
  List<Object> get props => [];
}

class HomeScreenInitialState extends HomeScreenState {}

class HomeScreenLoadingState extends HomeScreenState {}

// ignore: must_be_immutable
class HomeScreenSuccessState extends HomeScreenState {
  HomeScreenSuccessState(this.homeScreenModels);

  HomeScreenModels homeScreenModels;

  @override
  List<Object> get props => [];
}

// ignore: must_be_immutable
class HomeScreenErrorState extends HomeScreenState {
  HomeScreenErrorState(this._message);

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

class HomeScreenEmptyState extends HomeScreenState{

}