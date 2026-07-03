import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/notification_model.dart';
import 'notification_event.dart';
import 'notification_state.dart';

class NotificationBloc
    extends Bloc<NotificationEvent, NotificationState> {

  NotificationBloc() : super(NotificationInitial()) {

    on<LoadNotifications>(_loadNotifications);

    on<MarkAllRead>(_markAllRead);

    on<MarkNotificationRead>(_markNotificationRead);
  }

  void _loadNotifications(
      LoadNotifications event,
      Emitter<NotificationState> emit,
      ) {

    emit(
      NotificationLoaded(
        [

          NotificationModel(
            title: "New Order Received",
            subtitle: "QB-2024-0001261",
            time: "2m ago",
            icon: "🛍️",
          ),

          NotificationModel(
            title: "Payment Received",
            subtitle: "QB-2024-0001258",
            time: "5m ago",
            icon: "💳",
          ),

          NotificationModel(
            title: "Inventory Low Alert",
            subtitle: "Goat stock below 50",
            time: "15m ago",
            icon: "⚠️",
          ),

          NotificationModel(
            title: "Time Slot Full",
            subtitle: "08:00 AM - 08:00 AM",
            time: "30m ago",
            icon: "🕒",
          ),

          NotificationModel(
            title: "Payout Initiated",
            subtitle: "SAR 15,000",
            time: "1h ago",
            icon: "💵",
          ),
        ],
      ),
    );
  }

  void _markAllRead(
      MarkAllRead event,
      Emitter<NotificationState> emit,
      ) {
    if (state is NotificationLoaded) {
      final currentState = state as NotificationLoaded;

      final updatedNotifications = currentState.notifications.map((notification) {
        return notification.copyWith(
          isRead: true,
        );
      }).toList();

      emit(
        NotificationLoaded(updatedNotifications),
      );
    }
  }
  void _markNotificationRead(
      MarkNotificationRead event,
      Emitter<NotificationState> emit,
      ) {
    if (state is NotificationLoaded) {
      final currentState = state as NotificationLoaded;

      final updatedNotifications =
      List<NotificationModel>.from(currentState.notifications);

      updatedNotifications[event.index] =
          updatedNotifications[event.index].copyWith(
            isRead: true,
          );

      emit(NotificationLoaded(updatedNotifications));
    }
  }
}