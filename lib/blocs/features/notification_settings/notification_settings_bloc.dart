import 'package:flutter_bloc/flutter_bloc.dart';

import 'notification_settings_event.dart';
import 'notification_settings_state.dart';

class NotificationSettingsBloc
    extends Bloc<NotificationSettingsEvent,
        NotificationSettingsState> {
  NotificationSettingsBloc()
      : super(NotificationSettingsState.initial()) {
    on<ToggleEnableNotifications>(
          (event, emit) {
        emit(
          state.copyWith(
            enableNotifications: event.value,
          ),
        );
      },
    );

    on<ToggleOrderUpdates>(
          (event, emit) {
        emit(
          state.copyWith(
            orderUpdates: event.value,
          ),
        );
      },
    );

    on<ToggleBookingReminders>(
          (event, emit) {
        emit(
          state.copyWith(
            bookingReminders: event.value,
          ),
        );
      },
    );

    on<TogglePayoutUpdates>(
          (event, emit) {
        emit(
          state.copyWith(
            payoutUpdates: event.value,
          ),
        );
      },
    );

    on<ToggleSystemAlerts>(
          (event, emit) {
        emit(
          state.copyWith(
            systemAlerts: event.value,
          ),
        );
      },
    );

    on<ToggleVibration>(
          (event, emit) {
        emit(
          state.copyWith(
            vibration: event.value,
          ),
        );
      },
    );

    on<ToggleSound>(
          (event, emit) {
        emit(
          state.copyWith(
            sound: event.value,
          ),
        );
      },
    );

    on<UpdateQuietHours>(
          (event, emit) {
        emit(
          state.copyWith(
            quietStart: event.start,
            quietEnd: event.end,
          ),
        );
      },
    );
  }
}