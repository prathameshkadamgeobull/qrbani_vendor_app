import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/ai_capacity_model.dart';

import 'ai_capacity_planner_event.dart';
import 'ai_capacity_planner_state.dart';

class AICapacityPlannerBloc
    extends Bloc<AICapacityPlannerEvent, AICapacityPlannerState> {
  AICapacityPlannerBloc()
      : super(
    AICapacityPlannerState(
      model: const AICapacityModel(
        date: "10 Dhul-Hijjah 1446",
        recommendedCapacity: 120,
        currentCapacity: 100,
        suggestedIncrease: 20,
      ),
    ),
  ) {
    on<LoadCapacityData>((event, emit) {});

    on<ChangeDate>((event, emit) {
      emit(
        state.copyWith(
          model: AICapacityModel(
            date: event.date,
            recommendedCapacity: 120,
            currentCapacity: 100,
            suggestedIncrease: 20,
          ),
        ),
      );
    });

    on<ApplyRecommendation>((event, emit) {
      // API Later
    });
  }
}