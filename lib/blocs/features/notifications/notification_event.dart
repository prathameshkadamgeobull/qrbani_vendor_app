import 'package:equatable/equatable.dart';

abstract class NotificationEvent extends Equatable {
  const NotificationEvent();

  @override
  List<Object> get props => [];
}

class LoadNotifications extends NotificationEvent {}

class MarkAllRead extends NotificationEvent {}

class MarkNotificationRead extends NotificationEvent {
  final int index;

  const MarkNotificationRead(this.index);

  @override
  List<Object> get props => [index];
}