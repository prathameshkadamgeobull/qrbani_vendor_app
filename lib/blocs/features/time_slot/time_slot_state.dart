import 'package:equatable/equatable.dart';

import '../../../models/time_slot_model.dart';

class TimeSlotState extends Equatable {
final bool isLoading;
final List<TimeSlotModel> timeSlots;
final String selectedDate;

const TimeSlotState({
this.isLoading = false,
this.timeSlots = const [],
this.selectedDate = "",
});

TimeSlotState copyWith({
bool? isLoading,
List<TimeSlotModel>? timeSlots,
String? selectedDate,
}) {
return TimeSlotState(
isLoading: isLoading ?? this.isLoading,
timeSlots: timeSlots ?? this.timeSlots,
selectedDate: selectedDate ?? this.selectedDate,
);
}

@override
List<Object?> get props => [
isLoading,
timeSlots,
selectedDate,
];
}