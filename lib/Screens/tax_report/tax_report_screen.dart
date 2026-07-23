import 'dart:io';
import 'dart:math';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:qrbani_vender_app/Screens/tax_report/widgets/summary_card.dart';
import 'package:qrbani_vender_app/Screens/tax_report/widgets/date_range_widget.dart';
import 'package:qrbani_vender_app/Screens/tax_report/widgets/tax_chart.dart';
import 'package:qrbani_vender_app/Screens/tax_report/widgets/tax_details.dart';
import 'package:share_plus/share_plus.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../blocs/features/tax_report/tax_report_bloc.dart';
import '../../blocs/features/tax_report/tax_report_event.dart';
import '../../blocs/features/tax_report/tax_report_state.dart';
import '../dashboard/widgets/custom_bottom_nav.dart';

class TaxReportScreen extends StatefulWidget {
  const TaxReportScreen({super.key});

  @override
  State<TaxReportScreen> createState() => _TaxReportScreenState();
}

class _TaxReportScreenState extends State<TaxReportScreen> {


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

  String get formattedDateRange {
    if (selectedDateRange == null) {
      return "Select Date Range";
    }

    final start =
    DateFormat("dd MMM yyyy").format(selectedDateRange!.start);

    final end =
    DateFormat("dd MMM yyyy").format(selectedDateRange!.end);

    return "$start - $end";
  }

  Future<void> _showDateRangePicker() async {
    await showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: SizedBox(
            height: 450,
            width: 350,
            child: SfDateRangePicker(
              selectionMode: DateRangePickerSelectionMode.range,

              showNavigationArrow: true,

              allowViewNavigation: true,

              showActionButtons: true,

              monthViewSettings: const DateRangePickerMonthViewSettings(
                firstDayOfWeek: 1,
              ),

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

                    context.read<TaxReportBloc>().add(
                      LoadTaxReport(
                        startDate: value.startDate,
                        endDate: value.endDate,
                      ),
                    );
                  }
                }

                Navigator.pop(context);
              },

              onCancel: () {
                Navigator.pop(context);
              },
            ),
          ),
        );
      },
    );
  }


  List<String> getChartLabels() {
    if (selectedDateRange == null) {
      return [
        "May 14",
        "May 15",
        "May 16",
        "May 17",
        "May 18",
        "May 19",
        "May 20",
      ];
    }

    List<String> labels = [];

    DateTime current = selectedDateRange!.start;

    while (!current.isAfter(selectedDateRange!.end)) {
      labels.add(DateFormat("MMM dd").format(current));
      current = current.add(const Duration(days: 1));
    }

    return labels;
  }

  /// Dummy data until API is integrated
  List<double> getChartValues() {
    final random = Random();

    return List.generate(
      getChartLabels().length,
          (index) => 3000 + random.nextInt(4500).toDouble(),
    );
  }

  @override
  void initState() {
    context.read<TaxReportBloc>().add(LoadTaxReport());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        backgroundColor:Colors.white,
        title: const Text("Tax Report"),

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

      body: BlocBuilder<TaxReportBloc, TaxReportState>(
        builder: (context, state) {

          if(state is TaxReportLoading){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if(state is TaxReportLoaded){

            final report = state.report;

            return SingleChildScrollView(

              padding: const EdgeInsets.all(16),

              child: Column(

                children: [

                  DateRangeWidget(
                    dateRange: formattedDateRange,
                    onTap: _showDateRangePicker,
                  ),

                  const SizedBox(height: 12),

                  GridView.count(

                    shrinkWrap: true,

                    physics: const NeverScrollableScrollPhysics(),

                    crossAxisCount: 2,

                    childAspectRatio: 2.2,

                    crossAxisSpacing: 4,

                    mainAxisSpacing: 4,

                    children: [

                      SummaryCard(
                        title: "Total Tax Collected",
                        amount: report.totalCollected,
                      ),

                      SummaryCard(
                        title: "Total Tax Paid",
                        amount: report.totalPaid,
                      ),

                      SummaryCard(
                        title: "CGST (9%)",
                        amount: report.cgst,
                      ),

                      SummaryCard(
                        title: "SGST (9%)",
                        amount: report.sgst,
                      ),



                    ],
                  ),

                  const SizedBox(height: 10),

                  TaxChart(
                    values: getChartValues(),
                    labels: getChartLabels(),
                  ),

                  const SizedBox(height: 10),

                  TaxDetails(
                    report: report,
                  )

                ],
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