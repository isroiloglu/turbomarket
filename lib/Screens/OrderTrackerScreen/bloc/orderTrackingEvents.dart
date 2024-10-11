import 'package:equatable/equatable.dart';

abstract class TrackOrderScreenEvent extends Equatable {
  const TrackOrderScreenEvent();


  @override
  List<Object> get props => [];
}
class LoadingEvent extends TrackOrderScreenEvent {
  const LoadingEvent();

  @override
  List<Object> get props => [];
}
class TrackOrderScreenDataFetchEvent extends TrackOrderScreenEvent {
  final String  orderId;
  const TrackOrderScreenDataFetchEvent(this.orderId);
}