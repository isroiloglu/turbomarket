import 'package:equatable/equatable.dart';

import '../../../Models/OrderTrackModel/orderTrackModel.dart';

abstract class TrackOrderState extends Equatable {
  const TrackOrderState();

  @override
  List<Object> get props => [];
}
class LoadingState extends TrackOrderState {}
class TrackOrderCompleteState extends TrackOrderState {}

class TrackOrderScreenInitial extends TrackOrderState {

}

class TrackOrderScreenSuccess extends TrackOrderState {
  const TrackOrderScreenSuccess(this.trackModel);

  final OrderTrackModel trackModel;

  @override
  List<Object> get props => [trackModel];
}

// ignore: must_be_immutable
class TrackOrderScreenError extends TrackOrderState {
  TrackOrderScreenError(this._message);

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