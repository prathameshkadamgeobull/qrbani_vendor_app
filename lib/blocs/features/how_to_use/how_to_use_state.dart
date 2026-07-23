import 'package:equatable/equatable.dart';

import '../../../models/guide_step_model.dart';

abstract class HowToUseState extends Equatable {
  const HowToUseState();

  @override
  List<Object?> get props => [];
}

/// Initial State
class HowToUseInitial extends HowToUseState {}

/// Loading State
class HowToUseLoading extends HowToUseState {}

/// Loaded State
class HowToUseLoaded extends HowToUseState {
  final List<GuideStepModel> guideSteps;

  const HowToUseLoaded({
    required this.guideSteps,
  });

  @override
  List<Object?> get props => [guideSteps];
}

/// Error State
class HowToUseError extends HowToUseState {
  final String message;

  const HowToUseError(this.message);

  @override
  List<Object?> get props => [message];
}