import '../../../models/payout_report_model.dart';


abstract class PayoutReportState{}
class PayoutReportInitial extends PayoutReportState{}



class PayoutReportLoading extends PayoutReportState{}



class PayoutReportLoaded extends PayoutReportState{


  final PayoutReportModel report;


  PayoutReportLoaded(this.report);

}

class PayoutReportError extends PayoutReportState{


  final String message;


  PayoutReportError(this.message);
}