import 'package:equatable/equatable.dart';

import '../../../models/inventory_report_model.dart';


abstract class StockReportState extends Equatable {
  const StockReportState();

  @override
  List<Object?> get props => [];
}

/// Initial State
class StockReportInitial extends StockReportState {
  const StockReportInitial();
}

/// Loading State
class StockReportLoading extends StockReportState {
  const StockReportLoading();
}

/// Loaded State
class StockReportLoaded extends StockReportState {
  final StockReportModel report;
  final DateTime selectedDate;
  final String selectedFilter;

  const StockReportLoaded({
    required this.report,
    required this.selectedDate,
    this.selectedFilter = "All",
  });

  StockReportLoaded copyWith({
    StockReportModel? report,
    DateTime? selectedDate,
    String? selectedFilter,
  }) {
    return StockReportLoaded(
      report: report ?? this.report,
      selectedDate: selectedDate ?? this.selectedDate,
      selectedFilter: selectedFilter ?? this.selectedFilter,
    );
  }

  @override
  List<Object?> get props => [
    report,
    selectedDate,
    selectedFilter,
  ];
}

/// Error State
class StockReportError extends StockReportState {
  final String message;

  const StockReportError(this.message);

  @override
  List<Object?> get props => [message];
}