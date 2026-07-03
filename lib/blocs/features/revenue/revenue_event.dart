import 'package:equatable/equatable.dart';

abstract class RevenueEvent extends Equatable {
  const RevenueEvent();

  @override
  List<Object?> get props => [];
}

/// Load Revenue Dashboard
class LoadRevenue extends RevenueEvent {
  const LoadRevenue();
}