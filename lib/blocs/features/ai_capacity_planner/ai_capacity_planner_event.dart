abstract class AICapacityPlannerEvent {}

class LoadCapacityData extends AICapacityPlannerEvent {}

class ChangeDate extends AICapacityPlannerEvent {
  final String date;

  ChangeDate(this.date);
}

class ApplyRecommendation extends AICapacityPlannerEvent {}