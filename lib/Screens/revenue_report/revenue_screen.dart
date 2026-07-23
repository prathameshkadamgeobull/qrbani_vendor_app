import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:qrbani_vender_app/Screens/revenue_report/widgets/revenue_breakdown_card.dart';
import 'package:qrbani_vender_app/Screens/revenue_report/widgets/revenue_chart.dart';
import 'package:qrbani_vender_app/Screens/revenue_report/widgets/revenue_date_range.dart';
import 'package:qrbani_vender_app/Screens/revenue_report/widgets/revenue_summary_card.dart';
import 'package:share_plus/share_plus.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';


import '../../blocs/features/revenue_report/revenue_bloc.dart';
import '../../blocs/features/revenue_report/revenue_event.dart';
import '../../blocs/features/revenue_report/revenue_state.dart';
import '../dashboard/widgets/custom_bottom_nav.dart';


class RevenueReportScreen extends StatefulWidget {
  const RevenueReportScreen({super.key});

  @override
  State<RevenueReportScreen> createState() =>
      _RevenueReportScreenState();
}

class _RevenueReportScreenState
    extends State<RevenueReportScreen> {

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


  DateTimeRange? selectedDateRange;

  @override
  void initState() {
    super.initState();

    context.read<RevenueReportBloc>().add(
      const LoadRevenueReport(),
    );
  }

  String get formattedDateRange {
    if (selectedDateRange == null) {
      return "Select Date Range";
    }

    return "${DateFormat("dd MMM yyyy").format(selectedDateRange!.start)} - "
        "${DateFormat("dd MMM yyyy").format(selectedDateRange!.end)}";
  }

  Future<void> _pickDateRange() async {
    await showDialog(
      context: context,
      builder: (_) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: SizedBox(
          height: 450,
          child: SfDateRangePicker(
            selectionMode: DateRangePickerSelectionMode.range,
            showActionButtons: true,
            showNavigationArrow: true,

            onSubmit: (value) {
              if (value is PickerDateRange) {
                if (value.startDate != null &&
                    value.endDate != null) {
                  setState(() {
                    selectedDateRange = DateTimeRange(
                      start: value.startDate!,
                      end: value.endDate!,
                    );
                  });

                  context.read<RevenueReportBloc>().add(
                    LoadRevenueReport(
                      startDate: value.startDate,
                      endDate: value.endDate,
                    ),
                  );
                }

                Navigator.pop(context);
              }
            },

            onCancel: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF7F7F7),

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Revenue Report",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),

        actions: [
          PopupMenuButton<String>(
            icon: const Icon(
              Icons.more_vert,
              color: Colors.black,
            ),
            onSelected: (value) {
              if (value == 'download') {
                downloadPdf();
              } else if (value == 'share') {
                sharePdf();
              }
            },
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 'download',
                child: ListTile(
                  leading: Icon(Icons.download),
                  title: Text('Download PDF'),
                  contentPadding: EdgeInsets.zero,
                ),
              ),
              const PopupMenuItem(
                value: 'share',
                child: ListTile(
                  leading: Icon(Icons.share),
                  title: Text('Share PDF'),
                  contentPadding: EdgeInsets.zero,
                ),
              ),
            ],
          ),
        ],
      ),

      body: BlocBuilder<
          RevenueReportBloc,
          RevenueReportState>(
        builder: (context, state) {

          if (state is RevenueReportLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is RevenueReportLoaded) {

            final report = state.report;
            final selectedDays = selectedDateRange == null
                ? 7
                : selectedDateRange!.end
                .difference(selectedDateRange!.start)
                .inDays +
                1;

            return SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [

                  RevenueDateRange(
                    dateRange: formattedDateRange,
                    onTap: _pickDateRange,
                  ),

                  const SizedBox(height: 16),

                  RevenueSummaryCard(
                    totalRevenue: report.totalRevenue,
                    growthPercentage: report.growthPercentage,
                    selectedDays: selectedDays,
                  ),
                  const SizedBox(height: 16),

                  RevenueChart(
                    values: report.chartValues,
                    labels: report.chartLabels,
                  ),

                  const SizedBox(height: 16),

                  RevenueBreakdownCard(
                    report: report,
                  ),

                  const SizedBox(height: 20),
                ],
              ),
            );
          }

          if (state is RevenueReportError) {
            return Center(
              child: Text(state.message),
            );
          }

          return const SizedBox();
        },
      ),

      bottomNavigationBar:
      const CustomBottomNavigation(),
    );
  }
}