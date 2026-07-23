import 'package:equatable/equatable.dart';

import '../../../models/time_slot_model.dart';

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
  final TimeSlotModel slot;


  const AddTimeSlot({
    required this.slot,
  });


  @override
  List<Object?> get props => [
    slot,
  ];
}