import 'package:equatable/equatable.dart';

import '../../../Models/NotificationModel/notification_list_response.dart';

abstract class NotificationsScreenState extends Equatable {
  const NotificationsScreenState();

  @override
  List<Object> get props => [];
}

class NotificationsScreenInitial extends NotificationsScreenState {}

class NotificationsScreenFinish extends NotificationsScreenState {}

class NotificationsScreenSuccess extends NotificationsScreenState {
  const NotificationsScreenSuccess(this.notificationResponse);

  final List<NotificationResponse> notificationResponse;

  @override
  List<Object> get props => [notificationResponse];
}

// ignore: must_be_immutable
class NotificationsScreenError extends NotificationsScreenState {
  NotificationsScreenError(this._message);

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

class NotificationsScreenEmpty extends NotificationsScreenState{}