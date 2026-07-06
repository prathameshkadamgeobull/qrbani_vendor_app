import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary, // Green color
                        foregroundColor: AppColors.white,   // White text
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {},
                      child: const Text(
                        "View Details",
                        style: AppTextStyles.button,
                      ),
                    ),
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

