class AICapacityModel {
  final String date;
  final int recommendedCapacity;
  final int currentCapacity;
  final int suggestedIncrease;

  const AICapacityModel({
    required this.date,
    required this.recommendedCapacity,
    required this.currentCapacity,
    required this.suggestedIncrease,
  });
}