import '../../../models/ai_capacity_model.dart';

class AICapacityPlannerState {
  final AICapacityModel model;

  const AICapacityPlannerState({
    required this.model,
  });

  AICapacityPlannerState copyWith({
    AICapacityModel? model,
  }) {
    return AICapacityPlannerState(
      model: model ?? this.model,
    );
  }
}