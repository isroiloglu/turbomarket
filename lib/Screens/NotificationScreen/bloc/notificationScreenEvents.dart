import 'package:equatable/equatable.dart';

abstract class NotificationScreenEvent extends Equatable {
  const NotificationScreenEvent();


  @override
  List<Object> get props => [];
}

class NotificationScreenDataFetchEvent extends NotificationScreenEvent {
  const NotificationScreenDataFetchEvent();
}