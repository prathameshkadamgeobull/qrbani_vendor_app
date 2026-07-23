import 'package:equatable/equatable.dart';

abstract class HowToUseEvent extends Equatable {
  const HowToUseEvent();

  @override
  List<Object?> get props => [];
}

/// Load all guide steps
class LoadGuideSteps extends HowToUseEvent {}