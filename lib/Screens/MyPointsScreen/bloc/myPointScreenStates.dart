import 'package:equatable/equatable.dart';

import '../../../Models/MyPointsModel/myPointsResponse.dart';

abstract class MyPointScreenState extends Equatable{

}

class MyPointScreenInitialState extends MyPointScreenState{
  @override
  List<Object?> get props => [];
}

class MyPointScreenSuccessState extends MyPointScreenState{
  MyPointResponse response;
  MyPointScreenSuccessState(this.response);

  @override
  List<Object?> get props => [];
}

class MyPointsScreenErrorState extends MyPointScreenState{
  MyPointsScreenErrorState(this._message);
  String? _message;
  String? get message => _message;
  set message(String? message) {
    _message = message;
  }

  @override
  List<Object> get props => [];
}

class MyPointsScreenEmptyState extends MyPointScreenState{
  @override
  // implement props
  List<Object?> get props => [];

}