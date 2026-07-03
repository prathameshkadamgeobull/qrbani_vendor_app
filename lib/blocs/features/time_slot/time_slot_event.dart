import 'package:equatable/equatable.dart';

abstract class TimeSlotEvent extends Equatable {
  const TimeSlotEvent();

  @override
  List<Object?> get props => [];
}

/// Load Time Slots
class LoadTimeSlots extends TimeSlotEvent {
  const LoadTimeSlots();
}

/// Add New Time Slot
class AddTimeSlot extends TimeSlotEvent {
  final String time;
  final int capacity;

  const AddTimeSlot({
    required this.time,
    required this.capacity,
  });

  @override
  List<Object?> get props => [
    time,
    capacity,
  ];
}