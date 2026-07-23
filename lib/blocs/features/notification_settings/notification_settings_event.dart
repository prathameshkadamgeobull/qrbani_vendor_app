import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class NotificationSettingsEvent extends Equatable {
  const NotificationSettingsEvent();

  @override
  List<Object?> get props => [];
}

class ToggleEnableNotifications extends NotificationSettingsEvent {
  final bool value;

  const ToggleEnableNotifications(this.value);

  @override
  List<Object?> get props => [value];
}

class ToggleOrderUpdates extends NotificationSettingsEvent {
  final bool value;

  const ToggleOrderUpdates(this.value);

  @override
  List<Object?> get props => [value];
}

class ToggleBookingReminders extends NotificationSettingsEvent {
  final bool value;

  const ToggleBookingReminders(this.value);

  @override
  List<Object?> get props => [value];
}

class TogglePayoutUpdates extends NotificationSettingsEvent {
  final bool value;

  const TogglePayoutUpdates(this.value);

  @override
  List<Object?> get props => [value];
}

class ToggleSystemAlerts extends NotificationSettingsEvent {
  final bool value;

  const ToggleSystemAlerts(this.value);

  @override
  List<Object?> get props => [value];
}

class ToggleVibration extends NotificationSettingsEvent {
  final bool value;

  const ToggleVibration(this.value);

  @override
  List<Object?> get props => [value];
}

class ToggleSound extends NotificationSettingsEvent {
  final bool value;

  const ToggleSound(this.value);

  @override
  List<Object?> get props => [value];
}

class UpdateQuietHours extends NotificationSettingsEvent {
  final TimeOfDay start;
  final TimeOfDay end;

  const UpdateQuietHours({
    required this.start,
    required this.end,
  });

  @override
  List<Object?> get props => [start, end];
}