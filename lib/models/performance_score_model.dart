class PerformanceScoreModel {
  final double rating;
  final String status;
  final int orderCompletion;
  final int onTimeProcessing;
  final double customerRating;
  final String responseTime;

  const PerformanceScoreModel({
    required this.rating,
    required this.status,
    required this.orderCompletion,
    required this.onTimeProcessing,
    required this.customerRating,
    required this.responseTime,
  });
}