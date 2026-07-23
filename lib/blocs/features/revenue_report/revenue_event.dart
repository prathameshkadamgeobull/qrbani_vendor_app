import 'package:equatable/equatable.dart';

abstract class RevenueReportEvent extends Equatable {
  const RevenueReportEvent();

  @override
  List<Object?> get props => [];
}

/// Load report initially or based on selected date range
class LoadRevenueReport extends RevenueReportEvent {
  final DateTime? startDate;
  final DateTime? endDate;

  const LoadRevenueReport({
    this.startDate,
    this.endDate,
  });

  @override
  List<Object?> get props => [startDate, endDate];
}

/// Refresh report
class RefreshRevenueReport extends RevenueReportEvent {
  const RefreshRevenueReport();
}