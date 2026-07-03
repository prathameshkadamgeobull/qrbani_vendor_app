import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Core/constants/app_colors.dart';
import '../../../Core/constants/app_font_size.dart';
import '../../../Core/constants/app_text_style.dart';
import '../../../blocs/features/ai_capacity_planner/ai_capacity_planner_bloc.dart';
import '../../../blocs/features/ai_capacity_planner/ai_capacity_planner_event.dart';
import '../../../blocs/features/ai_capacity_planner/ai_capacity_planner_state.dart';


class AICapacityPlannerPage extends StatelessWidget {
  const AICapacityPlannerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AICapacityPlannerBloc()..add(LoadCapacityData()),
      child: const _AICapacityPlannerView(),
    );
  }
}

class _AICapacityPlannerView extends StatelessWidget {
  const _AICapacityPlannerView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        centerTitle: true,
        leading: const BackButton(color: AppColors.black,),
        title: Text(
          "AI Capacity Planner",
          style: AppTextStyles.appBarTitle,
        ),
      ),
      body: BlocBuilder<AICapacityPlannerBloc, AICapacityPlannerState>(
        builder: (context, state) {
          final data = state.model;

          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                /// Date
                const Text(
                  "Date",
                  style: AppTextStyles.bodySemiBold,
                ),

                const SizedBox(height: 10),

                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 3),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.textGrey,),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: data.date,
                      isExpanded: true,
                      icon: const Icon(Icons.keyboard_arrow_down),
                      items: const [
                        DropdownMenuItem<String>(
                          value: "10 Dhul-Hijjah 1446",
                          child: Text(
                            "10 Dhul-Hijjah 1446",
                            style: AppTextStyles.bodyLarge,
                          ),
                        ),
                        DropdownMenuItem<String>(
                          value: "11 Dhul-Hijjah 1446",
                          child: Text(
                            "11 Dhul-Hijjah 1446",
                            style: AppTextStyles.bodyLarge,
                          ),
                        ),
                      ],
                      onChanged: (value) {
                        if (value != null) {
                          context
                              .read<AICapacityPlannerBloc>()
                              .add(ChangeDate(value));
                        }
                      },
                    ),
                  ),
                ),

                const SizedBox(height: 24),

                /// Recommended Capacity Card
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 23,vertical: 23),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: AppColors.textGrey,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Recommended Capacity",
                        style: AppTextStyles.cardTitle,
                      ),

                      const SizedBox(height: 12),

                      Text(
                        "${data.recommendedCapacity} Orders",
                        style: AppTextStyles.metric.copyWith(
                          fontSize: AppFontSizes.s30,
                        ),
                      ),

                      const SizedBox(height: 10),

                      const Text(
                        "Based on historical data & current bookings",
                        style: AppTextStyles.cardSubtitle,

                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 16),

                /// Current Capacity Card
                /// Current Capacity Card
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 22,vertical: 22),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Current Capacity",
                        style: AppTextStyles.cardTitle,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "${data.currentCapacity} Orders",
                        style: AppTextStyles.amount,
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 16),

                /// Suggested Increase Card
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 24),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Suggested Increase",
                        style: AppTextStyles.cardTitle,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "+${data.suggestedIncrease} Orders",
                        style: AppTextStyles.amount,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),



              /// ✅ FIXED BUTTON POSITION
              bottomNavigationBar: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        context
                            .read<AICapacityPlannerBloc>()
                            .add(ApplyRecommendation());
                      },
                      child: const Text(
                        "Apply Recommendation",
                        style: AppTextStyles.button,
                      ),
                    ),
                  ),

                // const SizedBox(height: 10),
                ),
              ),

    );
  }
}