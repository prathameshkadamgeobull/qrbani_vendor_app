import 'dart:io';

import 'package:camera/camera.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:qrbani_vender_app/Screens/daily_report/widgets/date_header.dart';
import 'package:share_plus/share_plus.dart';

import '../../blocs/features/Daily_Reports/daily_report_bloc.dart';
import '../../blocs/features/Daily_Reports/daily_report_event.dart';
import '../../blocs/features/Daily_Reports/daily_report_state.dart';

import '../dashboard/widgets/custom_bottom_nav.dart';
import 'widgets/report_stats.dart';
import 'widgets/sales_overview.dart';
import 'widgets/top_selling_list.dart';

class ReportPage extends StatefulWidget {
  const ReportPage({super.key});

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {

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

  Future<void> _selectDate(DateTime currentDate) async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: currentDate,
      firstDate: DateTime(2024),
      lastDate: DateTime(2035),
    );

    if (pickedDate != null) {
      context.read<ReportBloc>().add(
        ChangeReportDate(pickedDate),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    context.read<ReportBloc>().add(const LoadReport());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F6FA),

      appBar: AppBar(
        backgroundColor: const Color(0xff0A6A3F),
        elevation: 0,
        centerTitle: true,

        iconTheme: const IconThemeData(
          color: Colors.white, // Back arrow color
        ),

        title: const Text(
          "Daily Report",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          PopupMenuButton<String>(
            icon: const Icon(
              Icons.more_vert,
              color: Colors.white,
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
      body: BlocBuilder<ReportBloc, ReportState>(
        builder: (context, state) {
          if (state is ReportLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is ReportLoaded) {
            return SingleChildScrollView(
              child: Column(
                children: [

                  /// Header
                  ReportHeader(
                    selectedDate: state.selectedDate,

                    report: state.report,

                    onDateTap: () {
                      _selectDate(state.selectedDate);
                    },
                  ),

                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [

                        /// Statistics
                        // ReportStats(
                        //   report: state.report,
                        // ),
                        //
                        // const SizedBox(height: 20),

                        /// Sales Overview
                        const SalesOverview(),

                        const SizedBox(height: 20),

                        /// Top Selling
                        const TopSellingList(),

                        const SizedBox(height: 30),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }

          if (state is ReportError) {
            return Center(
              child: Text(
                state.message,
                style: const TextStyle(color: Colors.red),
              ),
            );
          }

          return const SizedBox();
        },
      ),

      bottomNavigationBar: const CustomBottomNavigation(),
    );
  }

}