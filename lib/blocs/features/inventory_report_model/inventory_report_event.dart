import 'package:equatable/equatable.dart';

abstract class StockReportEvent extends Equatable {
  const StockReportEvent();

  @override
  List<Object?> get props => [];
}

/// Load report when page opens
class LoadStockReport extends StockReportEvent {
  const LoadStockReport();
}

/// Refresh report
class RefreshStockReport extends StockReportEvent {
  const RefreshStockReport();
}

/// Change selected date
class ChangeStockReportDate extends StockReportEvent {
  final DateTime selectedDate;

  const ChangeStockReportDate(this.selectedDate);

  @override
  List<Object?> get props => [selectedDate];
}

/// Apply filter
class ApplyStockFilter extends StockReportEvent {
  final String filter;

  const ApplyStockFilter(this.filter);

  @override
  List<Object?> get props => [filter];
}