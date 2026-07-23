import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:share_plus/share_plus.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../blocs/features/payout_report/payout_report_bloc.dart';
import '../../blocs/features/payout_report/payout_report_event.dart';
import '../../blocs/features/payout_report/payout_report_state.dart';

import '../dashboard/widgets/custom_bottom_nav.dart';
import 'widgets/date_range_box.dart';
import 'widgets/payout_header.dart';
import 'widgets/payout_history_card.dart';
import 'widgets/payout_overview_card.dart';
import 'widgets/total_payout_card.dart';

class PayoutReportScreen extends StatefulWidget {
  const PayoutReportScreen({super.key});

  @override
  State<PayoutReportScreen> createState() => _PayoutReportScreenState();
}

class _PayoutReportScreenState extends State<PayoutReportScreen> {



  Future<File> generateReportPdf() async {

    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {

          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [

              pw.Text(
                "Daily Report",
                style: pw.TextStyle(
                  fontSize: 24,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),

              pw.SizedBox(height: 20),

              pw.Text(
                "Date: ${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}",
              ),

              pw.SizedBox(height: 20),

              pw.Text(
                "Sales Overview",
                style: pw.TextStyle(
                  fontSize: 18,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),

              pw.SizedBox(height: 10),

              pw.Text(
                "Total Sales: 5000",
              ),

              pw.Text(
                "Total Orders: 25",
              ),

              pw.Text(
                "Top Selling Product: Chicken",
              ),

            ],
          );

        },
      ),
    );


    final directory = await getApplicationDocumentsDirectory();

    final file = File(
      "${directory.path}/daily_report.pdf",
    );

    await file.writeAsBytes(
      await pdf.save(),
    );


    return file;
  }

  Future<void> downloadPdf() async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        build: (_) => pw.Center(
          child: pw.Text("Daily Report"),
        ),
      ),
    );

    String? output = await FilePicker.platform.saveFile(
      dialogTitle: 'Save Daily Report',
      fileName: 'daily_report.pdf',
      bytes: await pdf.save(),
    );

    if (output != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("PDF saved successfully"),
        ),
      );
    }
  }
  Future<void> sharePdf() async {
    final file = await generateReportPdf();

    await Share.shareXFiles(
      [XFile(file.path)],
      text: 'Daily Report',
    );
  }
  DateTime? _startDate;
  DateTime? _endDate;

  @override
  void initState() {
    super.initState();

    context.read<PayoutReportBloc>().add(
      LoadPayoutReport(),
    );
  }

  Future<void> _selectDateRange() async {
    await showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: SizedBox(
            height: 450,
            child: SfDateRangePicker(
              selectionMode: DateRangePickerSelectionMode.range,
              view: DateRangePickerView.month,

              showNavigationArrow: true,

              allowViewNavigation: true,

              monthViewSettings: const DateRangePickerMonthViewSettings(
                firstDayOfWeek: 1,
              ),

              onSelectionChanged:
                  (DateRangePickerSelectionChangedArgs args) {

                if (args.value is PickerDateRange) {

                  final PickerDateRange range = args.value;


                  if (range.startDate != null &&
                      range.endDate != null) {


                    setState(() {

                      _startDate = range.startDate;

                      _endDate = range.endDate;

                    });


                    Navigator.pop(context);


                    // Reload payout based on selected date range
                    context.read<PayoutReportBloc>().add(

                      LoadPayoutReport(

                        startDate: _startDate,

                        endDate: _endDate,

                      ),

                    );

                  }

                }

              },
            ),
          ),
        );
      },
    );
  }

  String get _dateRange {
    if (_startDate == null || _endDate == null) {
      return "Select Date Range";
    }

    return "${DateFormat('dd MMM yyyy').format(_startDate!)}"
        " - "
        "${DateFormat('dd MMM yyyy').format(_endDate!)}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      appBar: PayoutHeader(
        onDownload: downloadPdf,
        onShare: sharePdf,
      ),

      body: BlocBuilder<PayoutReportBloc, PayoutReportState>(
        builder: (context, state) {
          if (state is PayoutReportLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is PayoutReportLoaded) {
            final report = state.report;

            return SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  DateRangeBox(
                    dateRange: _dateRange,
                    onTap: _selectDateRange,
                  ),

                  const SizedBox(height: 16),

                  TotalPayoutCard(
                    report: report,
                    paidDate: _endDate ?? _startDate,
                  ),

                  const SizedBox(height: 16),

                  PayoutOverviewCard(report: report),

                  const SizedBox(height: 16),

                  PayoutHistoryCard(report: report),
                ],
              ),
            );
          }

          return const Center(
            child: Text("No Data Found"),
          );
        },
      ),

      bottomNavigationBar: const CustomBottomNavigation(),
    );
  }
}