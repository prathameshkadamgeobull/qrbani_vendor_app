import '../../../models/order_report_model.dart';

abstract class OrderReportState {}


class OrderReportInitial extends OrderReportState {}


class OrderReportLoading extends OrderReportState {}


class OrderReportLoaded extends OrderReportState {

  final OrderReportModel report;


  OrderReportLoaded(this.report);

}


class OrderReportError extends OrderReportState {

  final String message;


  OrderReportError(this.message);

}