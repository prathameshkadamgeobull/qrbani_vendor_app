import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:share_plus/share_plus.dart';

import '../../blocs/features/inventory_report_model/inventory_report_bloc.dart';
import '../../blocs/features/inventory_report_model/inventory_report_event.dart';
import '../../blocs/features/inventory_report_model/inventory_report_state.dart';
import '../../models/inventory_report_model.dart';
import '../dashboard/widgets/custom_bottom_nav.dart';
import 'widgets/low_stock_list.dart';
import 'widgets/stock_header.dart';
import 'widgets/stock_status_chart.dart';
import 'widgets/stock_summary_card.dart';

class StockReportPage extends StatefulWidget {
  const StockReportPage({super.key});

  @override
  State<StockReportPage> createState() => _StockReportPageState();
}

class _StockReportPageState extends State<StockReportPage> {

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

  @override
  void initState() {
    super.initState();
    context.read<StockReportBloc>().add(
      const LoadStockReport(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F6FA),
      appBar: AppBar(
        title: const Text(
          "Inventory Report",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 1,
        shadowColor: Colors.black12,
        iconTheme: const IconThemeData(
          color: Colors.black,
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

      body: BlocBuilder<StockReportBloc, StockReportState>(
        builder: (context, state) {
          if (state is StockReportLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is StockReportError) {
            return Center(
              child: Text(state.message),
            );
          }

          if (state is StockReportLoaded) {

            final report = state.report;

            return RefreshIndicator(
              onRefresh: () async {
                context.read<StockReportBloc>().add(
                  const RefreshStockReport(),
                );
              },
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Column(
                  children: [
                    /// Green Header
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.fromLTRB(8, 8, 8, 10),
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color(0xff0C6A43),
                            Color(0xff075733),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                      child: Column(
                        children: [
                          StockHeader(
                            selectedDate: state.selectedDate,
                          ),
                          const SizedBox(height: 12),
                          StockSummaryCard(
                            report: state.report,
                          ),
                        ],
                      ),
                    ),

                    /// White Body
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          StockStatusChart(
                            report: state.report,
                          ),
                          const SizedBox(height: 20),

                          LowStockList(

                            report: report,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
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