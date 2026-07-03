import 'package:equatable/equatable.dart';

import '../../../models/notification_model.dart';

abstract class NotificationState extends Equatable {
  const NotificationState();

  @override
  List<Object> get props => [];
}

class NotificationInitial extends NotificationState {}

class NotificationLoaded extends NotificationState {
  final List<NotificationModel> notifications;

  const NotificationLoaded(this.notifications);

  @override
  List<Object> get props => [notifications];
}