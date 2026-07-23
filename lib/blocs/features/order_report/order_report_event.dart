import 'package:equatable/equatable.dart';

abstract class OrderReportEvent extends Equatable {
  const OrderReportEvent();

  @override
  List<Object> get props => [];
}

/// Load Report
class LoadOrderReport extends OrderReportEvent {

  final DateTime? startDate;
  final DateTime? endDate;


  LoadOrderReport({
    this.startDate,
    this.endDate,
  });

}

/// Refresh Report
class RefreshOrderReport extends OrderReportEvent {}