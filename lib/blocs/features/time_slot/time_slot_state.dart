import 'package:equatable/equatable.dart';

import '../../../models/time_slot_model.dart';

class TimeSlotState extends Equatable {
  final bool isLoading;
  final List<TimeSlotModel> timeSlots;

  const TimeSlotState({
    this.isLoading = false,
    this.timeSlots = const [],
  });

  TimeSlotState copyWith({
    bool? isLoading,
    List<TimeSlotModel>? timeSlots,
  }) {
    return TimeSlotState(
      isLoading: isLoading ?? this.isLoading,
      timeSlots: timeSlots ?? this.timeSlots,
    );
  }

  @override
  List<Object?> get props => [
    isLoading,
    timeSlots,
  ];
} 