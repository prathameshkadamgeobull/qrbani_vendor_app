import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:share_plus/share_plus.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../../../Core/constants/app_colors.dart';
import '../../../Core/constants/app_font_size.dart';
import '../../../Core/constants/app_text_style.dart';
import '../../../blocs/features/performance_score/performance_score_bloc.dart';
import '../../../blocs/features/performance_score/performance_score_event.dart';
import '../../../blocs/features/performance_score/performance_score_state.dart';

class PerformanceScorePage extends StatelessWidget {
  const PerformanceScorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
      PerformanceScoreBloc()..add(LoadPerformanceScore()),
      child: const _PerformanceScoreView(),
    );
  }
}

      class _PerformanceScoreView extends StatelessWidget {
        const _PerformanceScoreView();

        Future<File> generateReportPdf(dynamic data) async {
          final pdf = pw.Document();

          pdf.addPage(
            pw.Page(
              pageFormat: PdfPageFormat.a4,
              build: (_) {
                return pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text(
                      "Performance Score Report",
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

                    pw.Text("Performance Score : ${data.rating}"),
                    pw.Text("Status : ${data.status}"),
                    pw.Text("Order Completion : ${data.orderCompletion}%"),
                    pw.Text("On-time Processing : ${data.onTimeProcessing}%"),
                    pw.Text("Customer Rating : ${data.customerRating}/5"),
                    pw.Text("Response Time : ${data.responseTime}"),
                  ],
                );
              },
            ),
          );

          final directory = await getApplicationDocumentsDirectory();

          final file = File(
            "${directory.path}/performance_score.pdf",
          );

          await file.writeAsBytes(await pdf.save());

          return file;
        }

        Future<void> downloadPdf(
            BuildContext context,
            dynamic data,
            ) async {
          final file = await generateReportPdf(data);

          await FilePicker.platform.saveFile(
            dialogTitle: 'Save Performance Report',
            fileName: 'performance_score.pdf',
            bytes: await file.readAsBytes(),
          );

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("PDF saved successfully"),
            ),
          );
        }

        Future<void> sharePdf(dynamic data) async {
          final file = await generateReportPdf(data);

          await Share.shareXFiles(
            [XFile(file.path)],
            text: 'Performance Score Report',
          );
        }


        @override
        Widget build(BuildContext context) {
          return Scaffold(
            backgroundColor: AppColors.white,
            appBar: AppBar(
              backgroundColor: AppColors.white,
              elevation: 0,
              centerTitle: true,
              leading: const BackButton(color: AppColors.black),
              title: Text(
                "Performance Score",
                style: AppTextStyles.appBarTitle,
              ),
            ),
            body: BlocBuilder<PerformanceScoreBloc, PerformanceScoreState>(
              builder: (context, state) {
                final data = state.model;

                return SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      _buildGauge(data),
                      const SizedBox(height: 24),
                      _buildDetailsCard(data),
                      const SizedBox(height: 24),

                      Row(
                        children: [
                          Expanded(
                            child: SizedBox(
                              height: 50,
                              child: OutlinedButton.icon(
                                onPressed: () async {
                                  await sharePdf(data);
                                },
                                icon: const Icon(
                                  Icons.share_outlined,
                                  color: AppColors.primary,
                                  size: 20,
                                ),
                                label: Text(
                                  "Share",
                                  style: TextStyle(
                                    color: AppColors.primary,
                                    fontSize: AppFontSizes.bodyMedium, // or bodyLarge
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                style: OutlinedButton.styleFrom(
                                  side: const BorderSide(
                                    color: AppColors.primary,
                                    width: 1.5,
                                  ),
                                  backgroundColor: AppColors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(width: 16),

                          Expanded(
                            child: SizedBox(
                              height: 50,
                              child: ElevatedButton.icon(
                                onPressed: () async {
                                  await downloadPdf(context, data);
                                },
                                icon: const Icon(
                                  Icons.download_rounded,
                                  color: AppColors.white,
                                  size: 20,
                                ),
                                label: const Text(
                                  "Download",
                                  style: AppTextStyles.button,
                                ),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.primary,
                                  foregroundColor: AppColors.white,
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        }
      }

Widget _buildGauge(data) {
  return SizedBox(
    height: 280,
    child: Stack(
      alignment: Alignment.center,
      children: [
        SfRadialGauge(
          axes: [
            RadialAxis(
              minimum: 0,
              maximum: 5,
              showTicks: false,
              showLabels: false,
              startAngle: 145,
              endAngle: 35,
              axisLineStyle: const AxisLineStyle(
                thickness: 18,
                color: Color(0xffEFEFEF),
                thicknessUnit: GaugeSizeUnit.logicalPixel,
              ),
              pointers: [
                RangePointer(
                  value: data.rating,
                  // value: 4.7,
                  width: 18,
                  cornerStyle: CornerStyle.bothCurve,
                  gradient: const SweepGradient(
                    colors: [
                      // Colors.green,
                      // Colors.yellow,
                      Color(0xFF0A7D3A), // Dark Green
                      Color(0xFF8BC34A), // Light Green
                      Color(0xFFF4C430), // Yellow
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),

        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              data.rating.toString(),
              style: AppTextStyles.metric.copyWith(
                fontSize: 58,
              ),
            ),
            // ), Text(
            //   data.rating.toString(),
            //   style: AppTextStyles.metric.copyWith(
            //     fontSize: 58,
            //   ),
            // ),

            Text(
              data.status,
              style: AppTextStyles.sectionTitle,
            ),

            const SizedBox(height: 10),

            Row(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(5, (index) {
                if (index < data.rating.floor()) {
                  return const Icon(
                    Icons.star,
                    color: Colors.amber,
                    size: 26,
                  );
                } else if (index < data.rating) {
                  return const Icon(
                    Icons.star_half,
                    color: Colors.amber,
                    size: 26,
                  );
                } else {
                  return const Icon(
                    Icons.star_border,
                    color: Colors.amber,
                    size: 26,
                  );
                }
              }),
            ),
          ],
        ),
      ],
    ),
  );
}

Widget _buildDetailsCard(data) {
  return Container(
    decoration: BoxDecoration(
      color: AppColors.white,
      borderRadius: BorderRadius.circular(12),
      border: Border.all(
        color: AppColors.textGrey,
      ),
    ),
    child: Column(
      children: [
        _buildRow(
          "Order Completion",
          "${data.orderCompletion}%",
        ),
        const Divider(height: 1),
        _buildRow(
          "On-time Processing",
          "${data.onTimeProcessing}%",
        ),
        const Divider(height: 1),
        _buildRow(
          "Customer Rating",
          "${data.customerRating}/5",
        ),
        const Divider(height: 1),
        _buildRow(
          "Response Time",
          data.responseTime,
        ),
      ],
    ),
  );
}
Widget _buildRow(String title, String value) {
  return Padding(
    padding: const EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 18,
    ),
    child: Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: AppTextStyles.bodyLarge,
          ),
        ),
        Text(
          value,
          style: AppTextStyles.bodySemiBold.copyWith(
            color: Colors.green,
          ),
        ),
      ],
    ),
  );
}

