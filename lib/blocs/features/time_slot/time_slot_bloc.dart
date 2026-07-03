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
      const Duration(milliseconds: 600),
    );

    final slots = [
      const TimeSlotModel(
        time: "06:00 AM - 07:00 AM",
        capacity: 20,
        booked: 17,
        isFull: false,
      ),

      const TimeSlotModel(
        time: "07:00 AM - 08:00 AM",
        capacity: 25,
        booked: 24,
        isFull: false,
      ),

      const TimeSlotModel(
        time: "08:00 AM - 09:00 AM",
        capacity: 25,
        booked: 25,
        isFull: true,
      ),

      const TimeSlotModel(
        time: "09:00 AM - 10:00 AM",
        capacity: 25,
        booked: 13,
        isFull: false,
      ),

      const TimeSlotModel(
        time: "10:00 AM - 11:00 AM",
        capacity: 20,
        booked: 10,
        isFull: false,
      ),
    ];

    emit(
      state.copyWith(
        isLoading: false,
        timeSlots: slots,
      ),
    );
  }

  void _addTimeSlot(
      AddTimeSlot event,
      Emitter<TimeSlotState> emit,
      ) {
    final updatedSlots = List<TimeSlotModel>.from(state.timeSlots);

    updatedSlots.add(
      TimeSlotModel(
        time: event.time,
        capacity: event.capacity,
        booked: 0,
        isFull: false,
      ),
    );

    emit(
      state.copyWith(
        timeSlots: updatedSlots,
      ),
    );
  }
}