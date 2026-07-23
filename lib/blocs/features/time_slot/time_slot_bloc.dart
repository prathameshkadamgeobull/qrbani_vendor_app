import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/time_slot_model.dart';
import 'time_slot_event.dart';
import 'time_slot_state.dart';

class TimeSlotBloc extends Bloc<TimeSlotEvent, TimeSlotState> {
  TimeSlotBloc() : super(const TimeSlotState()) {
    on<LoadTimeSlots>(_loadTimeSlots);
    on<AddTimeSlot>(_addTimeSlot);
  }

  Future<void> _loadTimeSlots(
      LoadTimeSlots event,
      Emitter<TimeSlotState> emit,
      ) async {

    emit(
      state.copyWith(
        isLoading: true,
      ),
    );


    await Future.delayed(
      const Duration(milliseconds: 500),
    );


    emit(
      state.copyWith(
        isLoading: false,

        // Empty initially
        timeSlots: [],
      ),
    );

  }

  void _addTimeSlot(
      AddTimeSlot event,
      Emitter<TimeSlotState> emit,
      ) {
    final updatedSlots = List<TimeSlotModel>.from(state.timeSlots);

    updatedSlots.add(event.slot);

    emit(
      state.copyWith(
        timeSlots: updatedSlots,
        selectedDate: event.slot.date,
      ),
    );
  }
}