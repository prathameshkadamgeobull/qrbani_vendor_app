import '../../../models/performance_score_model.dart';

class PerformanceScoreState {
  final PerformanceScoreModel model;

  const PerformanceScoreState({
    required this.model,
  });

  PerformanceScoreState copyWith({
    PerformanceScoreModel? model,
  }) {
    return PerformanceScoreState(
      model: model ?? this.model,
    );
  }
}