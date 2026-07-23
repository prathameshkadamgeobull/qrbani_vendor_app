import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class NotificationSettingsState extends Equatable {
  final bool enableNotifications;

  final bool orderUpdates;
  final bool bookingReminders;
  final bool payoutUpdates;
  final bool systemAlerts;

  final bool vibration;
  final bool sound;

  final TimeOfDay quietStart;
  final TimeOfDay quietEnd;

  const NotificationSettingsState({
    required this.enableNotifications,
    required this.orderUpdates,
    required this.bookingReminders,
    required this.payoutUpdates,
    required this.systemAlerts,
    required this.vibration,
    required this.sound,
    required this.quietStart,
    required this.quietEnd,
  });

  factory NotificationSettingsState.initial() {
    return const NotificationSettingsState(
      enableNotifications: true,
      orderUpdates: true,
      bookingReminders: true,
      payoutUpdates: true,
      systemAlerts: true,
      vibration: true,
      sound: true,
      quietStart: TimeOfDay(hour: 22, minute: 0),
      quietEnd: TimeOfDay(hour: 8, minute: 0),
    );
  }

  NotificationSettingsState copyWith({
    bool? enableNotifications,
    bool? orderUpdates,
    bool? bookingReminders,
    bool? payoutUpdates,
    bool? systemAlerts,
    bool? vibration,
    bool? sound,
    TimeOfDay? quietStart,
    TimeOfDay? quietEnd,
  }) {
    return NotificationSettingsState(
      enableNotifications:
      enableNotifications ?? this.enableNotifications,
      orderUpdates: orderUpdates ?? this.orderUpdates,
      bookingReminders:
      bookingReminders ?? this.bookingReminders,
      payoutUpdates: payoutUpdates ?? this.payoutUpdates,
      systemAlerts: systemAlerts ?? this.systemAlerts,
      vibration: vibration ?? this.vibration,
      sound: sound ?? this.sound,
      quietStart: quietStart ?? this.quietStart,
      quietEnd: quietEnd ?? this.quietEnd,
    );
  }

  @override
  List<Object?> get props => [
    enableNotifications,
    orderUpdates,
    bookingReminders,
    payoutUpdates,
    systemAlerts,
    vibration,
    sound,
    quietStart,
    quietEnd,
  ];
}