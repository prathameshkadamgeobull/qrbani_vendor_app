import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:qrbani_vender_app/Screens/order_report/widgets/all_orders_screen.dart';
import 'package:qrbani_vender_app/Screens/order_report/widgets/date_picker_box.dart';
import 'package:qrbani_vender_app/Screens/order_report/widgets/filter_button.dart';
import 'package:qrbani_vender_app/Screens/order_report/widgets/order_chart.dart';
import 'package:qrbani_vender_app/Screens/order_report/widgets/recent_order_tile.dart';
import 'package:qrbani_vender_app/Screens/order_report/widgets/report_card.dart';
import 'package:share_plus/share_plus.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../Core/constants/AppConstants.dart';
import '../../Core/constants/app_text_style.dart';
import '../../blocs/features/order_report/order_report_bloc.dart';
import '../../blocs/features/order_report/order_report_event.dart';
import '../../blocs/features/order_report/order_report_state.dart';
import '../dashboard/widgets/custom_bottom_nav.dart';



class OrderReportScreen extends StatefulWidget {
  const OrderReportScreen({Key? key}) : super(key: key);

  @override
  State<OrderReportScreen> createState() =>
      _OrderReportScreenState();
}

class _OrderReportScreenState
    extends State<OrderReportScreen> {
  DateTimeRange? selectedRange;

  String get formattedDate {
    if (selectedRange == null) {
      return "Select Date";
    }

    final start = selectedRange!.start;
    final end = selectedRange!.end;


    return "${start.day}/${start.month}/${start.year} - "
        "${end.day}/${end.month}/${end.year}";
  }
  bool showAllOrders = false;

  PickerDateRange? _selectedRange;

  String get selectedDateRangeText {
    if (_selectedRange == null) {
      return "Select Date";
    }

    final DateTime start = _selectedRange!.startDate!;
    final DateTime end = _selectedRange!.endDate ?? start;


    return "${DateFormat('dd MMM yyyy').format(start)} - "
        "${DateFormat('dd MMM yyyy').format(end)}";
  }
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

  Future<void> _showDatePicker() async {
    await showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: SizedBox(
            height: 500,
            child: SfDateRangePicker(
              selectionMode: DateRangePickerSelectionMode.range,
              initialDisplayDate: DateTime.now(),

              minDate: DateTime(2000),
              maxDate: DateTime(2050),

              showNavigationArrow: true,

              allowViewNavigation: true,

              view: DateRangePickerView.month,

              onSelectionChanged:
                  (DateRangePickerSelectionChangedArgs args) {
                if (args.value is PickerDateRange) {
                  setState(() {
                    _selectedRange = args.value;
                  });
                }
              },

              onSubmit: (value) {

                Navigator.pop(context);


                if(_selectedRange != null &&
                    _selectedRange!.startDate != null &&
                    _selectedRange!.endDate != null){


                  context.read<OrderReportBloc>().add(

                    LoadOrderReport(

                      startDate: _selectedRange!.startDate,

                      endDate: _selectedRange!.endDate,

                    ),

                  );

                }

              },

              onCancel: () {
                Navigator.pop(context);
              },

              showActionButtons: true,
            ),
          ),
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();

    context.read<OrderReportBloc>().add(
      LoadOrderReport(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: const Color(0xfff5f5f5),

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Order Report",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
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
          OrderReportBloc,
          OrderReportState>(
        builder: (context, state) {

          if (state is OrderReportLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is OrderReportLoaded) {

            final report = state.report;
            // bool showAllOrders = false;

            return SingleChildScrollView(
              padding: EdgeInsets.all(
                AppConstants.screenPadding,
              ),

              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,

                children: [

                  /// Date Row
                  Row(
                    children: [

                      Expanded(
                        child: DatePickerBox(
                          dateRange: _selectedRange == null
                              ? report.dateRange
                              : selectedDateRangeText,
                          onTap: _showDatePicker,
                        ),
                      ),

                      const SizedBox(width: 12),

                      CalendarButton(
                        onTap: _showDatePicker,
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  /// Summary Cards
                  GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 3,
                    crossAxisSpacing: 2,
                    mainAxisSpacing:2,
                    childAspectRatio: 1.3,
                    children: [
                      ReportCard(
                        title: "Total Orders",
                        value: report.totalOrders.toString(),
                      ),
                      ReportCard(
                        title: "Completed",
                        value: report.completed.toString(),
                      ),
                      ReportCard(
                        title: "In Progress",
                        value: report.inProgress.toString(),
                      ),
                      ReportCard(
                        title: "Pending",
                        value: report.pending.toString(),
                      ),
                      ReportCard(
                        title: "Cancelled",
                        value: report.cancelled.toString(),
                      ),
                      ReportCard(
                        title: "Total Revenue",
                        value: "SAR ${report.totalRevenue.toStringAsFixed(0)}",
                      ),
                    ],
                  ),

                  const SizedBox(height: 25),

                  /// Chart
                  OrderChart(
                    completed:
                    report.completed,
                    pending:
                    report.pending,
                    inProgress:
                    report.inProgress,
                    cancelled:
                    report.cancelled,
                  ),

                  const SizedBox(height: 25),

                  /// Recent Orders Title
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      Text(
                        "Recent Orders",
                        style: AppTextStyles.sectionTitle,
                      ),


                      TextButton(
                        onPressed: () {

                          setState(() {

                            showAllOrders = !showAllOrders;

                          });

                        },

                        child: Text(

                          showAllOrders
                              ? "View Less"
                              : "View All",

                          style: const TextStyle(
                            color: Color(0xff0A5A36),
                            fontWeight: FontWeight.bold,
                          ),

                        ),
                      )

                    ],
                  ),

                  // const SizedBox(height: 10),

                  // const SizedBox(height: 15),

                  /// Recent Orders List
                  ListView.builder(

                    shrinkWrap: true,

                    physics: const NeverScrollableScrollPhysics(),


                    itemCount: showAllOrders
                        ? report.allOrders.length
                        : report.recentOrders.length,


                    itemBuilder: (context, index) {


                      final order = showAllOrders
                          ? report.allOrders[index]
                          : report.recentOrders[index];


                      return RecentOrderTile(

                        order: order,

                      );


                    },

                  ),

                  const SizedBox(height: 20),
                ],
              ),
            );
          }

          return const Center(
            child: Text("No Data"),
          );
        },
      ),

      bottomNavigationBar: const CustomBottomNavigation(),
    );
  }
}